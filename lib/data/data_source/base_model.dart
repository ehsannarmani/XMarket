class BaseModel <T>{
  late ResponseStatus status;
  late T data;
  late String message;

  BaseModel.loading() : status = ResponseStatus.Loading;
  BaseModel.success(this.data) : status = ResponseStatus.Success;
  BaseModel.failed({this.message = ""}) : status = ResponseStatus.Failed;
  BaseModel.exception({this.message = ""}) : status = ResponseStatus.Exception;

  @override
  String toString() {
    return "Status: $status \n message: $message \n data: $data";
  }
}

enum ResponseStatus{ Loading,Success,Failed,Exception}