String safeImageUrl(String? url) {
  if (url == null) return '';
  final trimmed = url.trim();
  return trimmed.isEmpty ? '' : trimmed;
}