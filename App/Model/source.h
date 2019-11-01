Config config {
    "version":"2.0",
    "response":"json",
    "pods":"YES",
    "filename":"PP",
    "request":"json"
}

message AppPage {
    optional string cellIdentify = @"";
    optional
}

message User {
    required int userId = 0;//用户ID
    optional string name = nil;//用户名
}
