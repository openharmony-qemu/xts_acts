'use static';


export class Event {
  constructor() {
    this.state = new AtomicInt(0);
  }

  public Wait(): boolean {
    while (this.state.load() == 0) {
    }
    return this.state.load() > 0;
  }

  public Fire(val: boolean = true): void {
    this.state.store(val ? 1 : -1);
  }

  private state: AtomicInt;
}

export class BaseClass {
  private count: number = 0;
  public lock_: AsyncLock = new AsyncLock()

  public async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count;
    })
  }

  public async increaseCount(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.count++;
    })
  }
}


export class CountClass {
  public count: int = 0

  public setCount(value: int): void {
    this.count = value
  }

  public getCount(): int {
    return this.count;
  }
}

export class SharedJob<T extends Job<void>> {
  private jobs: Array<T>;

  constructor(jobs: Array<T>) {
    this.jobs = jobs;
  }

  public Await(): void {
    for (let job of this.jobs) {
      job.Await();
    }
  }
}

export async function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
