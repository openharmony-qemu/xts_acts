// Shared module: process-wide module load observation point (used by all suites).
// Records each execution of module top-level code (i.e. one module load) by module
// name; counters of different modules are independent:
// - SharedTarget / SharedB / SharedC: shared modules, process singleton, count stays 1
// - NonSharedA / NonSharedD: non-shared modules, loaded once per thread, count grows with threads
// Note: recordLoad is called synchronously in module top-level code on each thread
// (top-level code cannot await an async lock), so concurrent pushes are theoretically
// racy; counts are accurate in practice, check here first if a count looks abnormal.
import { collections } from '@kit.ArkTS';

'use shared'

@Sendable
class LoadRecorder {
  // Load records (module name sequence, keeps actual load order for diagnosis)
  private records_: collections.Array<string> = new collections.Array<string>();

  // Record one execution of module top-level code (one module load)
  recordLoad(moduleName: string): void {
    this.records_.push(moduleName);
  }

  // Total load count (all modules combined)
  getLoadTimes(): number {
    return this.records_.length;
  }

  // Load count of the given module
  getLoadTimesOf(moduleName: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records_.length; i++) {
      if (this.records_[i] === moduleName) {
        count += 1;
      }
    }
    return count;
  }

  // Load record order (comma separated, for diagnosing load timing, e.g. lazy-ref suite)
  getRecordList(): string {
    let joined: string = '';
    for (let i = 0; i < this.records_.length; i++) {
      if (i > 0) {
        joined += ',';
      }
      joined += this.records_[i];
    }
    return joined;
  }
}

export let loadRecorder: LoadRecorder = new LoadRecorder();
