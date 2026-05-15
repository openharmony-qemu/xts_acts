/** 通用测试辅助（如 Ability）；SparseArray 相关见 sparseArray/Util.test.ets */
export default class Utils {
  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }
}
