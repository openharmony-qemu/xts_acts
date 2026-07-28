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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium';

class Animal {
  public name: string = 'animal'

  public speak(): string {
    return 'generic sound'
  }
}

class Cat extends Animal {
  public speak(): string {
    return 'meow'
  }

  public purr(): string {
    return 'purr'
  }
}

class Kitten extends Cat {
  public speak(): string {
    return 'mew'
  }
}

interface Producer<T> { produce(): T }

interface Consumer<T> { consume(value: T): void }

class CatProducer implements Producer<Cat> {
  public produce(): Cat {
    return new Cat()
  }
}

class AnimalConsumer implements Consumer<Animal> {
  private lastSound: string = ''

  public consume(value: Animal): void {
    this.lastSound = value.speak()
  }

  public readLastSound(): string {
    return this.lastSound
  }
}

interface InvariantHolder<T> {
  read(): T

  write(value: T): void
}

class CatInvariantHolder implements InvariantHolder<Cat> {
  private value: Cat

  constructor(value: Cat) {
    this.value = value
  }

  public read(): Cat {
    return this.value
  }

  public write(value: Cat): void {
    this.value = value
  }
}

interface PlainProducer<T> {
  produce(): T
}

class PlainCatProducer implements PlainProducer<Cat> {
  public produce(): Cat {
    return new Cat()
  }
}

export default function GenericVarianceTest() {
  describe('GenericVarianceTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0100
       * @tc.name      testProducerGenericUsage0001
       * @tc.desc      Verify producer generic usage in runnable positive suite (GTP-VA-001)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testProducerGenericUsage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let producer: Producer<Cat> = new CatProducer()
        expect(producer.produce().speak()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0200
       * @tc.name      testConsumerGenericUsage0002
       * @tc.desc      Verify consumer generic usage in runnable positive suite (GTP-VA-002)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testConsumerGenericUsage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let backingConsumer: AnimalConsumer = new AnimalConsumer()
        let consumer: Consumer<Animal> = backingConsumer
        consumer.consume(new Cat())
        expect(backingConsumer.readLastSound()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0300
       * @tc.name      testInvariantHolderUsage0003
       * @tc.desc      Verify holder read and write positions in runnable positive suite (GTP-VA-003)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testInvariantHolderUsage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let holder: InvariantHolder<Cat> = new CatInvariantHolder(new Cat())
        holder.write(new Cat())
        expect(holder.read().speak()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0400
       * @tc.name      testCovariantProducerReturnToBase0004
       * @tc.desc      Verify Producer<Cat> assignable to Producer<Animal> (covariance in output position) (GTP-VA-004)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testCovariantProducerReturnToBase0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let catProducer: Producer<Cat> = new CatProducer()
        let animalProducer: Producer<Animal> = catProducer
        expect(animalProducer.produce().speak()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0500
       * @tc.name      testContravariantConsumerAcceptsSubtype0005
       * @tc.desc      Verify Consumer<Animal> assignable to Consumer<Cat> (contravariance in input position) (GTP-VA-006)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testContravariantConsumerAcceptsSubtype0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let backingConsumer = new AnimalConsumer()
        let animalConsumer: Consumer<Animal> = backingConsumer
        let catConsumer: Consumer<Cat> = animalConsumer
        catConsumer.consume(new Cat())
        expect(backingConsumer.readLastSound()).assertEqual('meow')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0600
       * @tc.name      testExplicitProducerSubtypeReturn0006
       * @tc.desc      Verify explicit Producer<Sub> keeps subtype return behavior (GTP-VA-011)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testExplicitProducerSubtypeReturn0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let explicitProducer: Producer<Cat> = new CatProducer()
        let cat: Cat = explicitProducer.produce()
        expect(cat.purr()).assertEqual('purr')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_0700
       * @tc.name      testPlainProducerSubtypeReturn0007
       * @tc.desc      Verify plain Producer<Sub> keeps subtype return behavior without variance markers (GTP-VA-011)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testPlainProducerSubtypeReturn0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let plainProducer: PlainProducer<Cat> = new PlainCatProducer()
        let cat: Cat = plainProducer.produce()
        expect(cat.purr()).assertEqual('purr')
      })

      /**
       * @tc.number    SUB_GENERIC_VA_VARIANCE_1000
       * @tc.name      testVarianceRuntimeConsumerBehavior0010
       * @tc.desc      Verify generic consumer typing keeps runtime behavior unchanged (GTP-VA-012)
       * @tc.size      MediumTest
       * @tc.type      Function
       * @tc.level     Level 2
       */
      it('testVarianceRuntimeConsumerBehavior0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let consumer: AnimalConsumer = new AnimalConsumer()
        let typedConsumer: Consumer<Animal> = consumer
        typedConsumer.consume(new Kitten())
        expect(consumer.readLastSound()).assertEqual('mew')
      })
    })
}
