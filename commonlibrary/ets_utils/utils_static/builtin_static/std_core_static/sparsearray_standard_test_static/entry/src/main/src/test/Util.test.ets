'use static';
import { BusinessError } from '@ohos.base';
import { expect } from '../../../hypium/index';


export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    
    });
  }
}
