Config config {
    "version":"2.0",
    "response":"json",
    "pods":"YES",
    "filename":"PP",
    "request":"json"
}

message User {
    required int userId = 0;//用户ID
    optional string name = nil;//用户名
}

message Banner {
    optional string title = nil;//标题
    optional string imageUrl = nil;//图片URL
}

message Menu {
    optional string imageUrl = nil;//图片URL
    optional string title = nil;
}

message Card {
    optional string imageUrl = nil;
    optional string title = nil;
}
