'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

class User {
  public id: number = 0;
  public name: string = '';
  public age: number = 0;
}

class TreeNode {
  public value: number = 0;
  public left?: TreeNode;
  public right?: TreeNode;
}

async function buildTree(depth: number): Promise<TreeNode> {
  if (depth === 0) {
    const node: TreeNode = new TreeNode();
    node.value = depth;
    return node;
  }
  const node: TreeNode = new TreeNode();
  node.value = depth;
  node.left = await buildTree(depth - 1);
  node.right = await buildTree(depth - 1);
  return node;
}

export default function asyncAdvancedTest(): void {
  describe('asyncAdvancedTest', (): void => {
    afterEach((): void => { });
    afterAll((): void => {
    });

    /**
     * @tc.name   asyncAdvancedTest004
     * @tc.number SUB_BUILTINS_asyncAdvanced_TEST_004
     * @tc.desc   Test async function with utility types (Partial, Required)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncAdvancedTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const fetchPartialUser = async (): Promise<User> => {
        const user: User = new User();
        user.name = 'Bob';
        return user;
      };

      const result = await fetchPartialUser();
      expect(result.name).assertEqual('Bob');
      expect(result.id).assertEqual(0);
    });

    /**
     * @tc.name   asyncAdvancedTest006
     * @tc.number SUB_BUILTINS_asyncAdvanced_TEST_006
     * @tc.desc   Test async function with promise chaining and error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncAdvancedTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const chainWithRecovery = async (): Promise<string> => {
        try {
          const val1: number = await Promise.resolve(1);
          const val2: number = val1 * 2;

          if (val2 > 1) {
            throw new Error('Intentional error');
          }

          return val2.toString();
        } catch (e) {
          return 'recovered';
        }
      };

      const result = await chainWithRecovery();
      expect(result).assertEqual('recovered');
    });

    /**
     * @tc.name   asyncAdvancedTest011
     * @tc.number SUB_BUILTINS_asyncAdvanced_TEST_011
     * @tc.desc   Test async function with recursive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('asyncAdvancedTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tree = await buildTree(3);
      expect(tree.value).assertEqual(3);
      expect(tree.left !== undefined).assertTrue();
      expect(tree.right !== undefined).assertTrue();
      expect(tree.left!.value).assertEqual(2);
      expect(tree.right!.value).assertEqual(2);
    });
  });
}
