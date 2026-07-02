'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/** Iterator for {@link CustomIntArrayLike} backed by int storage. */
class CustomIntArrayLikeIterator implements IterableIterator<int> {
  private index: int = 0
  private readonly source: CustomIntArrayLike

  constructor(source: CustomIntArrayLike) {
    this.source = source
  }

  override next(): IteratorResult<int> {
    if (this.index >= this.source.length) {
      return new IteratorResult<int>()
    }
    const value = this.source.$_get(this.index)
    this.index++
    return new IteratorResult<int>(value)
  }
}

/**
 * Minimal user-defined ArrayLike<int> for static semantics coverage.
 * Copies constructor input so external mutation of the source array cannot desync length or iteration.
 */
export class CustomIntArrayLike implements ArrayLike<int>, Iterable<int> {
  private readonly data: Array<int>

  constructor(data: Array<int>) {
    this.data = [...data]
  }

  get length(): int {
    return this.data.length
  }

  $_get(index: int): int {
    if (index < 0 || index >= this.length) {
      throw new RangeError('Index out of range')
    }
    return this.data[index]
  }

  $_iterator(): IterableIterator<int> {
    return new CustomIntArrayLikeIterator(this)
  }
}
