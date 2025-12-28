/**
 * 工具类
 */
import ArrayList from '@ohos.util.ArrayList';

export default class CommonUtil {
  public static TAG:string = "ansTest"
  /**
   * 等待
   * @param ms 时间毫秒数
   * @returns NA
   */
  public static async sleep(ms: number) : Promise<void> {
    return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
  };

  public static  getRandomNumber(min: number, max: number): number {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

}
