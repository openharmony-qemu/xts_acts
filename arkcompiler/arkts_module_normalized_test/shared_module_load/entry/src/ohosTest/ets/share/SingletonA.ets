// Shared module (module under test): SingletonA from the official docs usage
// example (state-consistency suite). @Sendable class + ArkTSUtils.locks.AsyncLock:
// after concurrent increaseCount/getCount from multiple threads, getCount() must
// equal exactly initial + total increments (which also proves there is no lost
// update under AsyncLock and that all threads operate on the same instance)
import { ArkTSUtils } from '@kit.ArkTS';

'use shared'

@Sendable
class SingletonA {
  // Shared counter protected by the lock
  private count_: number = 0;
  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();

  async getCount(): Promise<number> {
    return this.lock_.lockAsync(() => {
      return this.count_;
    });
  }

  async increaseCount(): Promise<void> {
    await this.lock_.lockAsync(() => {
      this.count_ += 1;
    });
  }
}

export let singletonA: SingletonA = new SingletonA();
