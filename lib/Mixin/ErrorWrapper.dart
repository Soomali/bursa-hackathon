import 'package:bursa-hackathon/Model/ErrorModel.dart';
import 'package:flutter/cupertino.dart';

mixin ErrorWrapper on AsyncChangeNotifier{
  @protected
  List<Error> errors= [];

  @protected
  void addError(Error error){
    errors.add(error);
  }

  @protected
  void wrap (Function() wrapee, Error error){
    try {
      wrapee();
    }catch (e){
      addError(error);
      notifyListeners();
    }
  }

  Error? getError(String id){
    for(int i=0 ; i<errors.length; i++){
      if (errors[i].id == id){
        return errors[i];
      }
    }
    return null;
  }

  void removeError(String id){
    for(int i=0 ; i<errors.length; i++){
      if (errors[i].id == id){
        errors.removeAt(i);
      }
    }
  }
  Future<void> wrapAsync(Future Function() wrapee, String id, String message)async {
    try {
      state = AsyncChangeNotifierState.busy;
      notifyListeners();
      await wrapee();
    }catch (e){
      addError(Error(id:id,message: message));
    }
    state = AsyncChangeNotifierState.idle;
    notifyListeners();
  }
}