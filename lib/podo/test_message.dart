class TestMessage {
  final String testKey;

  const TestMessage({
    required this.testKey,
  });

  factory TestMessage.fromJson(Map<String, dynamic> json) {
    return TestMessage(testKey: json['testKey'] as String);
  }
}
