/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  beforeEach, describe, expect, it, Level, Size, TestType
} from '@ohos/hypium';
import {
  importedCapture,
  importedFactory,
  importedBinding,
  moduleVar,
  producerArgs,
  producerLastKey,
  producerWasCalled,
  resetProducerRecorder,
  moduleInitWasCalled,
  moduleInitHasKey,
  initFlags,
  DecoratorRecorder,
  targetKind,
  recorderHas
} from './DecoratorProducer';

const shared: DecoratorRecorder = new DecoratorRecorder()

function sharedRecorder(): DecoratorRecorder {
  return shared
}

function resetSharedRecorder(): void {
  shared.reset()
}

function captureKey(target: Object, key: string): void {
  shared.recordKey(key)
  shared.recordKind(targetKind(target))
  shared.markCalled()
}

enum Color { Red, Green, Blue }

interface IFoo { x: number }

class Plain {
  v: number = 1
}

function recKey(rec: DecoratorRecorder): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordKey(k)
    rec.recordKind(targetKind(t))
    rec.markCalled()
  }
}

function recArg(rec: DecoratorRecorder, arg: string): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(arg)
    rec.recordKey(k)
    rec.markCalled()
  }
}

function recNumArg(rec: DecoratorRecorder, n: number): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(String(n))
    rec.recordKey(k)
    rec.markCalled()
  }
}

function recMultiArg(
  rec: DecoratorRecorder, a: string, b: string, c: string
): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(a + ',' + b + ',' + c)
    rec.recordKey(k)
    rec.markCalled()
  }
}

function recFuncArg(rec: DecoratorRecorder, fn: () => string): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(fn())
    rec.recordKey(k)
    rec.markCalled()
  }
}

function recOrder(rec: DecoratorRecorder, label: string): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordOrder(label)
    rec.recordKey(k)
    rec.markCalled()
  }
}

function namedFn(): string {
  return 'normal'
}

class TagVal {
  tag: string;

  constructor(t: string) {
    this.tag = t
  }
}

function noArgFactory(): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    const s = sharedRecorder()
    s.recordArg('NONE')
    s.recordKey(k)
    s.recordKind(targetKind(t))
    s.markCalled()
  }
}

function paramDec(t: Object, k: string, idx: number): void {
  const s = sharedRecorder()
  s.recordArg(k + ':' + String(idx))
  s.markCalled()
}

function boolFactory(rec: DecoratorRecorder, b: boolean): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(String(b));
    rec.recordKey(k);
    rec.markCalled()
  }
}

function closureFactory(rec: DecoratorRecorder, captured: string): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(captured);
    rec.recordKey(k);
    rec.markCalled()
  }
}

function objFactory(rec: DecoratorRecorder, o: TagVal): (t: Object, k: string) => void {
  return (t: Object, k: string): void => {
    rec.recordArg(o.tag);
    rec.recordKey(k);
    rec.markCalled()
  }
}

export default function PropertyDecoratorTest() {
  describe('PropertyDecoratorTest', () => {
    beforeEach(() => {
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0100
     * @tc.name      testClassPropertyDecoratorInstanceFieldDecorator0001
     * @tc.desc      Verify an instance field property decorator runs with the field key.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorInstanceFieldDecorator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()
        const dec = recKey(rec)

        class Box {
          @dec value: number = 0
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('value')
        expect(rec.kindsList()[0]).assertEqual('instance')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0200
     * @tc.name      testClassPropertyDecoratorStaticFieldDecorator0002
     * @tc.desc      Verify a static field property decorator runs with the constructor target.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorStaticFieldDecorator0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()
      const dec = recKey(rec)

      class Box {
        @dec static count: number = 0
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('count')
      expect(rec.kindsList()[0]).assertEqual('static')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0300
     * @tc.name      testClassPropertyDecoratorIdentifierDecorator0003
     * @tc.desc      Verify a property decorator used as a bare identifier is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorIdentifierDecorator0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetSharedRecorder()

      class Box {
        @captureKey tag: string = 'id'
      }

      expect(sharedRecorder().wasCalled()).assertTrue()
      expect(sharedRecorder().lastKey()).assertEqual('tag')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0400
     * @tc.name      testClassPropertyDecoratorFactoryCallDecorator0004
     * @tc.desc      Verify a property decorator used as a factory call is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryCallDecorator0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) tag: string = 'fac'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0500
     * @tc.name      testClassPropertyDecoratorNoArgDecorator0005
     * @tc.desc      Verify a property decorator factory invoked with no payload argument is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorNoArgDecorator0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) tag: string = 'none'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0600
     * @tc.name      testClassPropertyDecoratorSingleArgDecorator0006
     * @tc.desc      Verify a property decorator factory invoked with a single argument records it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorSingleArgDecorator0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recArg(rec, 'single') tag: string = 's'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('single')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0700
     * @tc.name      testClassPropertyDecoratorMultiArgDecorator0007
     * @tc.desc      Verify a property decorator factory invoked with multiple arguments records them.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorMultiArgDecorator0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recMultiArg(rec, 'a', 'b', 'c') tag: string = 'm'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('a,b,c')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0800
     * @tc.name      testClassPropertyDecoratorLiteralArgDecorator0008
     * @tc.desc      Verify a property decorator factory accepts a literal argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorLiteralArgDecorator0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recNumArg(rec, 42) tag: string = 'l'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('42')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_0900
     * @tc.name      testClassPropertyDecoratorExpressionArgDecorator0009
     * @tc.desc      Verify a property decorator factory accepts an expression argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorExpressionArgDecorator0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recNumArg(rec, 1 + 2) tag: string = 'e'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('3')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1000
     * @tc.name      testClassPropertyDecoratorFunctionArgDecorator0010
     * @tc.desc      Verify a property decorator factory accepts a function argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFunctionArgDecorator0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recFuncArg(rec, () => 'fn') tag: string = 'f'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('fn')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1100
     * @tc.name      testClassPropertyDecoratorDecoratorWithFieldType0011
     * @tc.desc      Verify a property decorator coexists with an explicit field type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDecoratorWithFieldType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) value: number = 0
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('value')
        const b = new Box()
        b.value = 11
        expect(b.value).assertEqual(11)
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1200
     * @tc.name      testClassPropertyDecoratorDecoratorWithInitializer0012
     * @tc.desc      Verify a property decorator coexists with a field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDecoratorWithInitializer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) value: number = 99
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('value')
        expect(new Box().value).assertEqual(99)
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1300
     * @tc.name      testClassPropertyDecoratorDecoratorWithoutInitializer0013
     * @tc.desc      Verify a property decorator coexists with a field that has no initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDecoratorWithoutInitializer0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) value: number;

          constructor(v: number) {
            this.value = v
          }
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('value')
        expect(new Box(5).value).assertEqual(5)
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1400
     * @tc.name      testClassPropertyDecoratorDecoratorKeepsVisibility0014
     * @tc.desc      Verify a property decorator does not change field accessibility.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDecoratorKeepsVisibility0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) public open: number = 1
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('open')
        const b = new Box()
        b.open = 8
        expect(b.open).assertEqual(8)
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1500
     * @tc.name      testClassPropertyDecoratorNumberField0015
     * @tc.desc      Verify a property decorator applies to a number field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorNumberField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) n: number = 7
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('n')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1600
     * @tc.name      testClassPropertyDecoratorStringField0016
     * @tc.desc      Verify a property decorator applies to a string field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorStringField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) s: string = 'hi'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('s')
      expect(new Box().s).assertEqual('hi')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1700
     * @tc.name      testClassPropertyDecoratorBooleanField0017
     * @tc.desc      Verify a property decorator applies to a boolean field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorBooleanField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) b: boolean = true
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('b')
      expect(new Box().b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1800
     * @tc.name      testClassPropertyDecoratorBigintField0018
     * @tc.desc      Verify a property decorator applies to a bigint field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorBigintField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) bg: bigint = 10n
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('bg')
      expect(new Box().bg === 10n).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_1900
     * @tc.name      testClassPropertyDecoratorObjectField0019
     * @tc.desc      Verify a property decorator applies to an object field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorObjectField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) o: IFoo = { x: 2 }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('o')
      expect(new Box().o.x).assertEqual(2)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2000
     * @tc.name      testClassPropertyDecoratorClassTypeField0020
     * @tc.desc      Verify a property decorator applies to a class type field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorClassTypeField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) p: Plain = new Plain()
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('p')
      expect(new Box().p.v).assertEqual(1)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2100
     * @tc.name      testClassPropertyDecoratorInterfaceTypeField0021
     * @tc.desc      Verify a property decorator applies to an interface type field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorInterfaceTypeField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) iface: IFoo = { x: 4 }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('iface')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2200
     * @tc.name      testClassPropertyDecoratorArrayField0022
     * @tc.desc      Verify a property decorator applies to an array field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorArrayField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) arr: number[] = [1, 2, 3]
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('arr')
      expect(new Box().arr[1]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2300
     * @tc.name      testClassPropertyDecoratorEnumField0023
     * @tc.desc      Verify a property decorator applies to an enum field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorEnumField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) c: Color = Color.Green
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('c')
      expect(new Box().c).assertEqual(Color.Green)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2400
     * @tc.name      testClassPropertyDecoratorNullableField0024
     * @tc.desc      Verify a property decorator applies to a nullable field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorNullableField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) v: string | null = null
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('v')
      const b = new Box()
      b.v = 'set'
      expect(b.v).assertEqual('set')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2500
     * @tc.name      testClassPropertyDecoratorGenericField0025
     * @tc.desc      Verify a property decorator applies to a generic field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorGenericField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box<T> {
        @recKey(rec) value: T;

        constructor(v: T) {
          this.value = v
        }
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('value')
      expect(new Box<string>('g').value).assertEqual('g')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2600
     * @tc.name      testClassPropertyDecoratorReadonlyField0026
     * @tc.desc      Verify a property decorator applies to a readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorReadonlyField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) readonly r: number = 9
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('r')
      expect(new Box().r).assertEqual(9)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2700
     * @tc.name      testClassPropertyDecoratorStaticField0027
     * @tc.desc      Verify a property decorator applies to a static field with a constructor target.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorStaticField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) static s: number = 4
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('s')
      expect(Box.s).assertEqual(4)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2800
     * @tc.name      testClassPropertyDecoratorStaticReadonlyField0028
     * @tc.desc      Verify a property decorator applies to a static readonly field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorStaticReadonlyField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) static readonly sr: number = 12
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('sr')
      expect(Box.sr).assertEqual(12)
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_2900
     * @tc.name      testClassPropertyDecoratorPublicField0029
     * @tc.desc      Verify a property decorator applies to a public field.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorPublicField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recKey(rec) public p: number = 3
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('p')
      expect(recorderHas(rec, 'p')).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3000
     * @tc.name      testClassPropertyDecoratorDecoratorDoesNotAffectTypeCheck0030
     * @tc.desc      Verify a property decorator does not affect field type checking.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDecoratorDoesNotAffectTypeCheck0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) v: number = 10
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('v')
        expect(rec.kindsList()[0]).assertEqual('instance')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3100
     * @tc.name      testClassPropertyDecoratorFactoryNoArg0031
     * @tc.desc      Verify a decorator factory invoked with no arguments returns an applied decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryNoArg0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetSharedRecorder()

      class Box {
        @noArgFactory() tag: string = 'a'
      }

      expect(sharedRecorder().wasCalled()).assertTrue()
      expect(sharedRecorder().lastKey()).assertEqual('tag')
      expect(sharedRecorder().argsList()[0]).assertEqual('NONE')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3200
     * @tc.name      testClassPropertyDecoratorFactorySingleString0032
     * @tc.desc      Verify a decorator factory accepts a single string argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactorySingleString0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recArg(rec, 'str') tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('str')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3300
     * @tc.name      testClassPropertyDecoratorFactorySingleNumber0033
     * @tc.desc      Verify a decorator factory accepts a single number argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactorySingleNumber0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recNumArg(rec, 7) tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('7')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3400
     * @tc.name      testClassPropertyDecoratorFactorySingleBoolean0034
     * @tc.desc      Verify a decorator factory accepts a single boolean argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactorySingleBoolean0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @boolFactory(rec, true) tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('true')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3500
     * @tc.name      testClassPropertyDecoratorFactoryMultiArg0035
     * @tc.desc      Verify a decorator factory accepts multiple arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryMultiArg0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recMultiArg(rec, 'x', 'y', 'z') tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('x,y,z')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3600
     * @tc.name      testClassPropertyDecoratorFactoryArrowArg0036
     * @tc.desc      Verify a decorator factory accepts an arrow function argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryArrowArg0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recFuncArg(rec, () => 'arrow') tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('arrow')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3700
     * @tc.name      testClassPropertyDecoratorFactoryNormalFunctionArg0037
     * @tc.desc      Verify a decorator factory accepts a normal function argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryNormalFunctionArg0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recFuncArg(rec, namedFn) tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('normal')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3800
     * @tc.name      testClassPropertyDecoratorFactoryIifeArg0038
     * @tc.desc      Verify a decorator factory accepts an IIFE argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryIifeArg0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recArg(rec, (() => 'iife')()) tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('iife')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_3900
     * @tc.name      testClassPropertyDecoratorFactoryImportedBinding0039
     * @tc.desc      Verify a decorator factory accepts an imported binding argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryImportedBinding0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recArg(rec, importedBinding) tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('IMPORTED_BINDING')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4000
     * @tc.name      testClassPropertyDecoratorFactoryClassStaticValue0040
     * @tc.desc      Verify a decorator factory accepts a class static value argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryClassStaticValue0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Source {
          static val: string = 'STATIC'
        }

        class Box {
          @recArg(rec, Source.val) tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('STATIC')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4100
     * @tc.name      testClassPropertyDecoratorFactoryEnumValue0041
     * @tc.desc      Verify a decorator factory accepts an enum value argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryEnumValue0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recNumArg(rec, Color.Blue) tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual(String(Color.Blue))
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4200
     * @tc.name      testClassPropertyDecoratorFactoryLocalConst0042
     * @tc.desc      Verify a decorator factory accepts a local const argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryLocalConst0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()
      const local: string = 'LOCAL'

      class Box {
        @recArg(rec, local) tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('LOCAL')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4300
     * @tc.name      testClassPropertyDecoratorFactoryReturnsDecorator0043
     * @tc.desc      Verify a decorator factory returns a decorator function that is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryReturnsDecorator0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()
        const d = recKey(rec)

        class Box {
          @d tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4400
     * @tc.name      testClassPropertyDecoratorFactoryReturnsClosure0044
     * @tc.desc      Verify a decorator factory returns a closure decorator that captures its argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryReturnsClosure0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @closureFactory(rec, 'closed') tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('closed')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4500
     * @tc.name      testClassPropertyDecoratorFactoryEvaluationOrder0045
     * @tc.desc      Verify multiple decorator factories are evaluated in declaration order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryEvaluationOrder0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recOrder(rec, 'first') a: number = 0
          @recOrder(rec, 'second') b: number = 0
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('b')
        expect(rec.orderList()[0]).assertEqual('first')
        expect(rec.orderList()[1]).assertEqual('second')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4600
     * @tc.name      testClassPropertyDecoratorFactoryMultipleDecorators0046
     * @tc.desc      Verify a decorator factory applies across multiple property decorators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryMultipleDecorators0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) a: number = 0
          @recKey(rec) b: number = 0
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('b')
        expect(recorderHas(rec, 'a') && recorderHas(rec, 'b')).assertTrue()
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4700
     * @tc.name      testClassPropertyDecoratorFactoryTransformLowering0047
     * @tc.desc      Verify a decorator factory is applied after transform lowering.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryTransformLowering0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recKey(rec) tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4800
     * @tc.name      testClassPropertyDecoratorFactoryModuleScope0048
     * @tc.desc      Verify an imported decorator factory is applied in module scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryModuleScope0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      resetProducerRecorder()

      class Box {
        @importedFactory('modscope') impFacField: string = 'a'
      }

      expect(producerWasCalled()).assertTrue()
      expect(producerLastKey()).assertEqual('impFacField')
      expect(producerArgs().indexOf('modscope') >= 0).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_4900
     * @tc.name      testClassPropertyDecoratorImportDecoratorFunction0049
     * @tc.desc      Verify an imported decorator function is applied to a property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorImportDecoratorFunction0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        resetProducerRecorder()

        class Box {
          @importedCapture impFnField: string = 'a'
        }

        expect(producerWasCalled()).assertTrue()
        expect(producerLastKey()).assertEqual('impFnField')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5000
     * @tc.name      testClassPropertyDecoratorImportDecoratorFactory0050
     * @tc.desc      Verify an imported decorator factory is applied to a property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorImportDecoratorFactory0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        resetProducerRecorder()

        class Box {
          @importedFactory('impfac') impFacField2: string = 'a'
        }

        expect(producerWasCalled()).assertTrue()
        expect(producerLastKey()).assertEqual('impFacField2')
        expect(producerArgs().indexOf('impfac') >= 0).assertTrue()
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5100
     * @tc.name      testClassPropertyDecoratorImportDecoratorArg0051
     * @tc.desc      Verify a decorator receives an imported binding as its argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorImportDecoratorArg0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rec = new DecoratorRecorder()

      class Box {
        @recArg(rec, importedBinding) tag: string = 'a'
      }

      expect(rec.wasCalled()).assertTrue()
      expect(rec.lastKey()).assertEqual('tag')
      expect(rec.argsList()[0]).assertEqual('IMPORTED_BINDING')
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5200
     * @tc.name      testClassPropertyDecoratorExportClassDecorator0052
     * @tc.desc      Verify a property decorator applies to a field of an exported class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorExportClassDecorator0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(initFlags.exportClassDecoratorRan).assertTrue()
      expect(moduleInitWasCalled()).assertTrue()
      expect(moduleInitHasKey('field')).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5300
     * @tc.name      testClassPropertyDecoratorDefaultExportClassDecorator0053
     * @tc.desc      Verify a property decorator applies to a field of a default exported class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDefaultExportClassDecorator0053',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(initFlags.defaultExportDecoratorRan).assertTrue()
        expect(moduleInitWasCalled()).assertTrue()
        expect(moduleInitHasKey('tag')).assertTrue()
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5400
     * @tc.name      testClassPropertyDecoratorModuleInitOrder0054
     * @tc.desc      Verify a property decorator runs during module initialization.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorModuleInitOrder0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(initFlags.exportClassDecoratorRan && initFlags.defaultExportDecoratorRan).assertTrue()
      expect(moduleInitWasCalled()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5500
     * @tc.name      testClassPropertyDecoratorLoweringImportBinding0055
     * @tc.desc      Verify an imported binding remains usable as a decorator argument after lowering.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorLoweringImportBinding0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recArg(rec, importedBinding) tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('IMPORTED_BINDING')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5600
     * @tc.name      testClassPropertyDecoratorDecoratorWithModuleVar0056
     * @tc.desc      Verify a property decorator receives a module variable as its argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorDecoratorWithModuleVar0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()

        class Box {
          @recArg(rec, moduleVar) tag: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('tag')
        expect(rec.argsList()[0]).assertEqual('MODULE_VAR')
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5700
     * @tc.name      testClassPropertyDecoratorImportedFactoryReturnsDecorator0057
     * @tc.desc      Verify an imported factory returns a decorator that is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorImportedFactoryReturnsDecorator0057',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        resetProducerRecorder()
        const d = importedFactory('captured')

        class Box {
          @d impFacRetField: string = 'a'
        }

        expect(producerWasCalled()).assertTrue()
        expect(producerLastKey()).assertEqual('impFacRetField')
        expect(producerArgs().indexOf('captured') >= 0).assertTrue()
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5800
     * @tc.name      testClassPropertyDecoratorImportedDecoratorLocalInitializer0058
     * @tc.desc      Verify an imported decorator coexists with a local field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorImportedDecoratorLocalInitializer0058',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        resetProducerRecorder()

        class Box {
          @importedCapture impDecInitField: number = 10
        }

        expect(producerWasCalled()).assertTrue()
        expect(producerLastKey()).assertEqual('impDecInitField')
        expect(new Box().impDecInitField).assertEqual(10)
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_5900
     * @tc.name      testClassPropertyDecoratorAccessorAndPropertyBoundary0059
     * @tc.desc      Verify an accessor decorator and a property decorator coexist on one class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorAccessorAndPropertyBoundary0059',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const rec = new DecoratorRecorder()

        class Box {
          private _v: number = 0

          @recKey(rec)
          get v(): number {
            return this._v
          }

          set v(x: number) {
            this._v = x
          }

          @recKey(rec) prop: number = 5
        }

        const b = new Box()
        b.v = 8
        expect(rec.wasCalled()).assertTrue()
        expect(recorderHas(rec, 'v') && recorderHas(rec, 'prop')).assertTrue()
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_6000
     * @tc.name      testClassPropertyDecoratorParameterAndPropertyBoundary0060
     * @tc.desc      Verify a parameter decorator and a property decorator coexist on one class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorParameterAndPropertyBoundary0060',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const rec = new DecoratorRecorder()
        resetSharedRecorder()

        class Box {
          @recKey(rec) prop: number = 0

          m(@paramDec x: number): number {
            return x
          }
        }

        const b = new Box()
        b.m(3)
        expect(rec.wasCalled()).assertTrue()
        expect(recorderHas(rec, 'prop') && sharedRecorder().argsList()[0] === 'm:0').assertTrue()
        expect(sharedRecorder().wasCalled()).assertTrue()
      })

    /**
     * @tc.number    SUB_MODULE_DECORATOR_PROPERTY_6100
     * @tc.name      testClassPropertyDecoratorFactoryArgTypeAnomaly0061
     * @tc.desc      Verify a decorator factory accepts an anomalous object argument type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassPropertyDecoratorFactoryArgTypeAnomaly0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const rec = new DecoratorRecorder()
        const tv: TagVal = new TagVal('obj')

        class Box {
          @objFactory(rec, tv) field: string = 'a'
        }

        expect(rec.wasCalled()).assertTrue()
        expect(rec.lastKey()).assertEqual('field')
        expect(rec.argsList()[0]).assertEqual('obj')
      })
  })
}
