// Shared module (module under test): target of the process-singleton loading
// semantics (singleton suite). Triple verification mechanism:
// 1. Counter: top-level calls loadRecorder.recordLoad — under shared semantics it
//    executes only once per process, so the count stays 1
// 2. Marker: a unique loadId (load-{timestamp}-{random}) is generated when the
//    top-level code executes; each thread reads it back and compares
// 3. Cross-thread write/read: each thread writes its name into threadMarks_
//    (AsyncLock protected) and the main thread verifies them collectively
import { ArkTSUtils, collections } from '@kit.ArkTS';
import { loadRecorder } from './LoadRecorder';

'use shared'

// Top-level code: executed on module load (each execution is counted in the global
// observation point; under shared semantics it should happen exactly once)
loadRecorder.recordLoad('SharedTarget');

@Sendable
class SharedState {
  // Load marker: generated when the module is loaded (top-level executes);
  // a repeated load would produce a different marker
  private loadId_: string = `load-${Date.now()}-${Math.floor(Math.random() * 1000000)}`;
  // Thread names written by each thread, to verify the exported object is the same
  // instance across threads (writes are mutually visible)
  private threadMarks_: collections.Array<string> = new collections.Array<string>();
  // Protects concurrent writes to threadMarks_
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  getLoadId(): string {
    return this.loadId_;
  }

  async addThreadMark(name: string): Promise<void> {
    await this.lock_.lockAsync(() => {
      this.threadMarks_.push(name);
    });
  }

  getThreadMarkCount(): number {
    return this.threadMarks_.length;
  }

  hasThreadMark(name: string): boolean {
    for (let i = 0; i < this.threadMarks_.length; i++) {
      if (this.threadMarks_[i] === name) {
        return true;
      }
    }
    return false;
  }
}

export let sharedState: SharedState = new SharedState();
