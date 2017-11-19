Config config {
    "version":"2.0",
    "response":"json",
    "pods":"YES",
    "filename":"PP",
    "request":"json"
}

enum ChatType {
    CHAT_TYPE_MESSAGE,//普通文字消息
    CHAT_TYPE_PICTURE,//图片消息
    CHAT_TYPE_AUDIO,//语音消息
    CHAT_TYPE_VIDEO,//视频消息
    CHAT_TYPE_FILE,//文件类型
    CHAT_TYPE_OTHER,//其他文件
}

message ChatMessage {
    primary int messageId = 0;//消息ID
    required ChatType messageType = 0;//消息类型
    required bool needDestroy = NO;//是否是阅后即焚消息
    required int remind = 0;//倒计时时间剩余
    required string message = nil;//消息内容 除普通文字外 其他消息表示该文件的存储路径
    required int from = nil;//消息的发送者
    required int to = nil;//消息的接收者
    optional string topic = nil;//topic
}

message User {
    required int userId = 0;//用户ID
    optional string name = nil;//用户名
}

