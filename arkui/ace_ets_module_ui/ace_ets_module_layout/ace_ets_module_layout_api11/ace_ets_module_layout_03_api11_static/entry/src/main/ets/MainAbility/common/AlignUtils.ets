import { Alignment } from '@ohos.arkui.component';

export class AlignUtils{
  static getAlignment(content:number):Alignment{
    if(content == 0){
      return Alignment.TopStart;
    }else if(content == 1){
      return Alignment.Top;
    }else if(content == 2){
      return Alignment.TopEnd;
    }else if(content == 3){
      return Alignment.Start;
    }else if(content == 4){
      return Alignment.Center;
    }else if(content == 5){
      return Alignment.End;
    }else if(content == 6){
      return Alignment.BottomStart;
    }else if(content == 7){
      return Alignment.Bottom;
    }else{
      return Alignment.BottomEnd;
    }
  }
}