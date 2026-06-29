export default class Utils {
  static getAbsDiff(a: double, b: double): double {
    let diff: double = a - b;
    if (diff < 0.0) {
      diff = -diff;
    }
    return diff;
  }

  static getRelativeDiff(a: double, b: double): double {
    let denominator: double = b;
    if (denominator < 0.0) {
      denominator = -denominator;
    }
    if (denominator === 0.0) {
      return Utils.getAbsDiff(a, b);
    }
    return Utils.getAbsDiff(a, b) / denominator;
  }

  static isNaNValue(value: double): boolean {
    return isNaN(value);
  }

  static isNaNFloat(value: float): boolean {
    return isNaN(value);
  }

  static isFiniteValue(value: double): boolean {
    return isFinite(value);
  }

  static isFiniteFloat(value: float): boolean {
    return isFinite(value);
  }

  static isPositiveZero(value: number): boolean {
    return value === 0.0 && 1.0 / value === Double.POSITIVE_INFINITY;
  }

  static isNegativeZero(value: number): boolean {
    return value === 0.0 && 1.0 / value === Double.NEGATIVE_INFINITY;
  }

  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0);
      }, count);
    });
  }

  static async releaseAfterEachTest(): Promise<void> {
    await Utils.msSleep(25);
  }
}
