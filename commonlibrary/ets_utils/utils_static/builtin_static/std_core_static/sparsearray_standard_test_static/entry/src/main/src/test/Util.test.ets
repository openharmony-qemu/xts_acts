'use static'
import { BusinessError } from '@ohos.base';
import { expect } from '../../../hypium/index';

/** OpenHarmony 通用「参数错误」BusinessError.code（非法索引 / 实参类型等）。 */
export const SPARSE_ARRAY_INVALID_ARG_BUSINESS_ERROR_CODE: int = 401;


export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    
    });
  }
}
