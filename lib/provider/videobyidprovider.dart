import 'package:dtpocketfm/model/videobyidmodel.dart' as content;
import 'package:dtpocketfm/model/videobyidmodel.dart' as language;
import 'package:dtpocketfm/model/videobyidmodel.dart';
import 'package:dtpocketfm/utils/constant.dart';
import 'package:dtpocketfm/webservice/apiservices.dart';
import 'package:flutter/material.dart';

class VideoByIDProvider extends ChangeNotifier {
  VideoByIdModel videoByIdModel = VideoByIdModel();

  bool loading = false;

  bool isloading = false, loadMore = false;
  //content
  int? totalRows, totalPage, currentPage;
  bool? isMorePage;
  List<content.Result>? contentDataList = [];

  List<language.Result>? videoDataList = [];

  setLoading(isLoading) {
    loading = isLoading;
    notifyListeners();
  }

  setContentDataPaginationData(
      int? totalRows, int? totalPage, int? currentPage, bool? isMorePage) {
    this.currentPage = currentPage;
    this.totalRows = totalRows;
    this.totalPage = totalPage;
    this.isMorePage = isMorePage;
    notifyListeners();
  }

  Future<void> getVideoByCategory(categoryID, typeId, pageNo) async {
    debugPrint("getVideoByCategory userID :======> ${Constant.userID}");
    debugPrint("getVideoByCategory categoryID :==> $categoryID");
    debugPrint("getVideoByCategory typeId :======> $typeId");
    debugPrint("getVideoByCategory pageNo :======> $pageNo");
    loading = true;
    
    // Clear existing data if this is the first page
    if (pageNo == 1) {
      videoDataList?.clear();
      debugPrint("Cleared existing videoDataList for fresh data");
    }
    
    videoByIdModel =
        await ApiService().videoByCategory(categoryID, typeId, pageNo);
    
    debugPrint("API Response Status: ${videoByIdModel.status}");
    debugPrint("API Response Message: ${videoByIdModel.message}");
    debugPrint("API Response Result Length: ${videoByIdModel.result?.length ?? 0}");
    debugPrint("API Response Total Rows: ${videoByIdModel.totalRows}");
    
    if (videoByIdModel.status == 200) {
      setContentDataPaginationData(
          videoByIdModel.totalRows,
          videoByIdModel.totalPage,
          videoByIdModel.currentPage,
          videoByIdModel.morePage);
      if (videoByIdModel.result != null &&
          (videoByIdModel.result?.length ?? 0) > 0) {
        debugPrint("Processing ${videoByIdModel.result?.length} items from API");
        for (var i = 0; i < (videoByIdModel.result?.length ?? 0); i++) {
          videoDataList?.add(videoByIdModel.result?[i] ?? language.Result());
        }
        final Map<int, language.Result> postMap = {};
        videoDataList?.forEach((item) {
          postMap[item.id ?? 0] = item;
        });
        videoDataList = postMap.values.toList();
        debugPrint("Final videoDataList length: ${videoDataList?.length ?? 0}");
        setLoadMore(false);
      } else {
        debugPrint("No data received from API or result is null/empty");
      }
    } else {
      debugPrint("API call failed with status: ${videoByIdModel.status}");
    }

    loading = false;
    notifyListeners();
  }

  Future<void> getVideoByLanguage(languageID, typeId, pageNo) async {
    loading = true;
    videoByIdModel =
        await ApiService().videoByLanguage(languageID, typeId, pageNo);
    if (videoByIdModel.status == 200) {
      setContentDataPaginationData(
          videoByIdModel.totalRows,
          videoByIdModel.totalPage,
          videoByIdModel.currentPage,
          videoByIdModel.morePage);
      if (videoByIdModel.result != null &&
          (videoByIdModel.result?.length ?? 0) > 0) {
        for (var i = 0; i < (videoByIdModel.result?.length ?? 0); i++) {
          videoDataList?.add(videoByIdModel.result?[i] ?? language.Result());
        }
        final Map<int, language.Result> postMap = {};
        videoDataList?.forEach((item) {
          postMap[item.id ?? 0] = item;
        });
        videoDataList = postMap.values.toList();
        setLoadMore(false);
      }
    }
    loading = false;
    notifyListeners();
  }

  clearVideoByIDProvider() {
    debugPrint("<================ clearVideoByIDProvider ================>");
    videoByIdModel = VideoByIdModel();
    videoDataList?.clear();
    currentPage = 0;
    totalPage = 0;
    totalRows = 0;
    isMorePage = false;
    notifyListeners();
  }

  setLoadMore(loadMore) {
    this.loadMore = loadMore;
    notifyListeners();
  }
}
