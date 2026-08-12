/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class DependencyChain {
  private dependencies_: collections.Map<string, string>
  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock, dependencies_: collections.Map<string, string>) {
    this.dependencies_ = dependencies_
    this.lock_ = lock_
  }


  async addDependency(module: string, depends: string[]): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.dependencies_.set(module, depends.join(','))
    })
  }

  async getDependencies(module: string): Promise<string[]> {
    return await this.lock_.lockAsync((): string[] => {
      const depsStr: string | undefined = this.dependencies_.get(module)
      if (depsStr !== undefined && depsStr !== '') {
        return depsStr.split(',')
      }
      return []
    })
  }

  async getDependencyChain(module: string): Promise<string[]> {
    return await this.lock_.lockAsync((): string[] => {
      const result: string[] = []
      let visited: string = ''
      visited = this.collectDependencies(module, result, visited)
      return result
    })
  }

  private collectDependencies(module: string, result: string[], visited: string): string {
    if (visited.split(',').indexOf(module) >= 0) {
      return visited
    }
    visited = visited === '' ? module : visited + ',' + module
    const depsStr: string | undefined = this.dependencies_.get(module)
    if (depsStr !== undefined && depsStr !== '') {
      const deps: string[] = depsStr.split(',')
      for (let i = 0; i < deps.length; i++) {
        visited = this.collectDependencies(deps[i], result, visited)
        result.push(deps[i])
      }
    }
    return visited
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.dependencies_.clear()
    })
  }

  async getModuleCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let count: number = 0
      this.dependencies_.forEach((_value: string, _key: string): void => {
        count++
      })
      return count
    })
  }
}

@Concurrent
async function addDependencyTask(chain: DependencyChain, module: string, deps: string[]): Promise<void> {
  await chain.addDependency(module, deps)
}

export default function DependencyChainTest(): void {
  describe('DependencyChainTest', (): void => {
    const chain: DependencyChain = new DependencyChain(new ArkTSUtils.locks.AsyncLock(), new collections.Map<string, string>())

    beforeEach(async (): Promise<void> => {
      await chain.clear()
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testDependencyChain0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0100
     * @tc.desc   Verify adding single dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDependencyChain0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB'])

      const deps: string[] = await chain.getDependencies('moduleA')
      expect(deps.length).assertEqual(1)
      expect(deps[0]).assertEqual('moduleB')
    })

    /**
     * @tc.name   testDependencyChain0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0200
     * @tc.desc   Verify adding multiple dependencies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDependencyChain0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB', 'moduleC', 'moduleD'])

      const deps: string[] = await chain.getDependencies('moduleA')
      expect(deps.length).assertEqual(3)
    })

    /**
     * @tc.name   testDependencyChain0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0300
     * @tc.desc   Verify dependency chain resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDependencyChain0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB'])
      await chain.addDependency('moduleB', ['moduleC'])

      const depChain: string[] = await chain.getDependencyChain('moduleA')
      expect(depChain.length).assertEqual(2)
      expect(depChain[0]).assertEqual('moduleC')
      expect(depChain[1]).assertEqual('moduleB')
    })

    /**
     * @tc.name   testDependencyChain0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0400
     * @tc.desc   Verify circular dependency handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDependencyChain0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB'])
      await chain.addDependency('moduleB', ['moduleA'])

      const depChain: string[] = await chain.getDependencyChain('moduleA')
      expect(depChain.length <= 2).assertTrue()
    })

    /**
     * @tc.name   testDependencyChain0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0500
     * @tc.desc   Verify getDependencies for non-existent module returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDependencyChain0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const deps: string[] = await chain.getDependencies('nonexistent')
      expect(deps.length).assertEqual(0)
    })

    /**
     * @tc.name   testDependencyChain0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0600
     * @tc.desc   Verify module count tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDependencyChain0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB'])
      await chain.addDependency('moduleB', ['moduleC'])

      const count: number = await chain.getModuleCount()
      expect(count).assertEqual(2)
    })

    /**
     * @tc.name   testDependencyChain0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0700
     * @tc.desc   Verify clear removes all dependencies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDependencyChain0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB'])
      await chain.clear()

      const count: number = await chain.getModuleCount()
      expect(count).assertEqual(0)
    })

    /**
     * @tc.name   testDependencyChain0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0800
     * @tc.desc   Verify concurrent dependency addition with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDependencyChain0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const modules: string[][] = [['modA', 'modB'], ['modC', 'modD'], ['modE', 'modF']]
      const tasks: taskpool.Task[] = modules.map((pair: string[]): taskpool.Task =>
        new taskpool.Task(addDependencyTask, chain, pair[0], [pair[1]])
      )
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      const count: number = await chain.getModuleCount()
      expect(count).assertEqual(3)
    })

    /**
     * @tc.name   testDependencyChain0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_0900
     * @tc.desc   Verify deep dependency chain resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDependencyChain0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      await chain.addDependency('A', ['B'])
      await chain.addDependency('B', ['C'])
      await chain.addDependency('C', ['D'])

      const depChain: string[] = await chain.getDependencyChain('A')
      expect(depChain.length).assertEqual(3)
    })

    /**
     * @tc.name   testDependencyChain1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DEPENDENCY_CHAIN_TEST_1000
     * @tc.desc   Verify dependency chain for leaf module returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDependencyChain1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      await chain.addDependency('moduleA', ['moduleB'])

      const depChain: string[] = await chain.getDependencyChain('moduleB')
      expect(depChain.length).assertEqual(0)
    })
  })
}
