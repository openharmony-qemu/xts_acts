import { hilog } from '@kit.PerformanceAnalysisKit';

export class Utils {
  static sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve) => setTimeout(resolve, ms));
  }
}

export default Utils;
