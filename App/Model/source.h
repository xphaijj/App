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
    optional string logo = nil;
    optional string sex = nil;
    optional string age = nil;
}

message Normal {
    optional string title = nil;//标题
    optional string subtitle = nil;//副标题
    optional string imageUrl = nil;//图片资源
    optional string thumbImage = nil;//缩略图
    optional string rightTitle = nil;//右副标题
}

message Banner {
    optional string title = nil;//标题
    optional string imageUrl = nil;//图片URL
}

message Menu {
    optional string imageUrl = nil;//图片URL
    optional string title = nil;
}

message Course {
    optional string imageUrl = nil;
    optional string title = nil;
}

message Teacher {
    optional string imageUrl = nil;
    optional string title = nil;
}
