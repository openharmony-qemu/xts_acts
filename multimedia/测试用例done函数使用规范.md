# 测试用例done函数使用规范

## 规范概述

测试用例中`done()`函数的使用需遵循以下规范，确保测试能正确结束，不会出现hang住或超时问题。

---

## 一、Promise类型API

### 正确模式1：await + try-catch-finally（推荐）

Promise类型的函数只需要使用`await`，**不要和`.then().catch()`一起使用**。推荐使用`try-catch-finally`模式：

```typescript
it('test_case', async (done: Function) => {
  try {
    const result = await someOperation();
    expect(result).assertTrue();
    await cleanup();
  } catch (error) {
    console.error('Test failed:', error);
    expect().assertFail();
    await cleanup();
  } finally {
    done();  // 确保done()总是被调用
  }
});
```

**优点：**
- 代码简洁，`done()`只需写一次
- 确保无论成功或失败都能正确结束

### 正确模式2：await + try-catch（两分支done）

也可以使用`try-catch`模式，在`try`和`catch`两个分支都调用`done()`：

```typescript
it('test_case', async (done: Function) => {
  try {
    const result = await someOperation();
    expect(result).assertTrue();
    await cleanup();
    done();  // 成功分支调用done()
  } catch (error) {
    console.error('Test failed:', error);
    expect().assertFail();
    await cleanup();
    done();  // 失败分支调用done()
  }
});
```

**注意：**
- `try`和`catch`两个分支都必须调用`done()`
- 如果某个分支遗漏`done()`，会导致测试无法正确结束

**关键点：**
- 只使用`await`，不使用`.then().catch()`
- `await`会等待Promise完成，异常会被`catch`捕获
- 确保所有执行路径都能调用`done()`

### 错误模式1：await + then混用

```typescript
// 错误示例 - await和then不要一起使用
it('test_case', async (done: Function) => {
  try {
    await someOperation().then(() => {  // ← 不要这样写！
      expect(true).assertTrue();
    }).catch((error) => {  // ← await和then/catch混用，代码冗余
      expect().assertFail();
    });
    done();
  } catch (error) {
    expect().assertFail();
    done();
  }
});
```

**问题：**
- `await`已经能处理Promise结果和异常，`.then().catch()`是冗余代码
- 混用会导致代码逻辑混乱，难以维护

### 错误模式2：无await + .catch()无done()

```typescript
// 错误示例 - 会导致测试无法正确结束
it('test_case', async (done: Function) => {
  someOperation().then(() => {
    expect(true).assertTrue();
    done();  // then中有done()
  }).catch((error) => {
    expect().assertFail();
    // catch中没有done()！错误时测试无法结束
  });
});
```

**修复方案：** 改用`await + try-catch`模式（推荐使用finally，或在两分支都调用done）

---

## 二、回调类型API（如capture、start、stop、release）

### 正确模式1：标志位 + 循环等待 + finally（推荐）

回调类型API需要使用标志位等待回调完成，推荐使用`finally`确保`done()`被调用：

```typescript
it('test_case', async (done: Function) => {
  let callbackDone = false;
  
  try {
    someObject.someMethod((error) => {
      if (error) {
        expect().assertFail();
      } else {
        expect(true).assertTrue();
      }
      callbackDone = true;  // 回调中更新标志位
    });
    
    // 循环等待回调完成
    let startTime = Date.now();
    while (!callbackDone) {
      await sleep(100);
      if (Date.now() - startTime > 5000) {  // 超时5秒
        expect().assertFail();
        break;
      }
    }
    
    await cleanup();
  } finally {
    done();  // 确保回调完成后才调用done()
  }
});
```

**优点：**
- 代码简洁，`done()`只需写一次
- 回调等待逻辑复杂时，使用`finally`更安全

### 正确模式2：标志位 + 循环等待 + 两分支done

也可以使用`try-catch`模式，在`try`和`catch`两个分支都调用`done()`：

```typescript
it('test_case', async (done: Function) => {
  let callbackDone = false;
  
  try {
    someObject.someMethod((error) => {
      if (error) {
        expect().assertFail();
      } else {
        expect(true).assertTrue();
      }
      callbackDone = true;
    });
    
    let startTime = Date.now();
    while (!callbackDone) {
      await sleep(100);
      if (Date.now() - startTime > 5000) {
        expect().assertFail();
        break;
      }
    }
    
    await cleanup();
    done();  // 成功分支调用done()
  } catch (error) {
    expect().assertFail();
    await cleanup();
    done();  // 失败分支调用done()
  }
});
```

### 错误模式：回调未等待就提前done()

```typescript
// 错误示例 - 回调还未执行完成就调用done()
it('test_case', async (done: Function) => {
  someObject.someMethod((error) => {
    if (error) {
      expect().assertFail();
      done();  // 只有失败分支有done()
    } else {
      expect(true).assertTrue();
      // 成功分支没有done()！
    }
  });
  await cleanup();
  done();  // 回调可能还没执行完就调用done()
});
```

**问题：**
- 回调函数可能在`done()`之后才执行
- 回调中的断言无效
- 成功/失败分支处理不一致

---

## 三、常见问题总结

| 问题类型 | 严重程度 | 说明 |
|---------|---------|------|
| await + then混用 | B级 | 代码冗余，逻辑混乱 |
| 无await + .catch()无done() | B级 | 错误时测试无法结束 |
| 回调成功分支无done() | A级 | 成功时测试hang住 |
| 回调未等待就提前done() | B级 | 回调中断言无效 |

---

## 四、检查清单

生成测试用例时需检查：

1. **Promise类型API：**
   - 是否只使用了`await`（不混用`.then().catch()`）？
   - 是否使用了`try-catch`结构？
   - 确保所有执行路径都能调用`done()`：
     - 推荐使用`try-catch-finally`，`done()`在`finally`中
     - 或使用`try-catch`，`done()`在`try`和`catch`两个分支

2. **回调类型API：**
   - 是否使用了标志位等待回调？
   - 成功和失败分支是否都有标志位更新？
   - 是否有超时机制？
   - 确保所有执行路径都能调用`done()`：
     - 推荐使用`try-catch-finally`，`done()`在`finally`中
     - 或使用`try-catch`，`done()`在`try`和`catch`两个分支

---

## 五、参考示例

### 正确的Promise用例示例

```typescript
it('capture_promise_001', Level.LEVEL0, async (done: Function) => {
  const testName = 'capture_promise_001';
  try {
    mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
    await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
    
    await mPhotoOutput.capture();  // 只使用await，不使用.then()
    expect(true).assertTrue();
    
    await releasePhotoSession();
  } catch (error) {
    console.error(TAG, testName + ' failed. err: ' + error.code);
    expect().assertFail();
    await releasePhotoSession();
  } finally {
    done();  // 确保done()总是被调用
  }
});
```

### 正确的回调用例示例

```typescript
it('capture_callback_001', Level.LEVEL0, async (done: Function) => {
  const testName = 'capture_callback_001';
  let callbackDone = false;
  
  try {
    mPhotoOutput = mCameraManager.createPhotoOutput(mCameraOutputCap.photoProfiles[0]);
    await getPhotoSession(testName, mPreviewOutput, mPhotoOutput);
    
    mPhotoOutput.capture((error) => {
      if (error) {
        expect().assertFail();
      } else {
        expect(true).assertTrue();
      }
      callbackDone = true;
    });
    
    let startTime = Date.now();
    while (!callbackDone) {
      await sleep(100);
      if (Date.now() - startTime > 5000) {
        expect().assertFail();
        break;
      }
    }
    
    await releasePhotoSession();
  } finally {
    done();
  }
});
```

---

## 六、最佳实践总结

| API类型 | 推荐模式 | 核心要点 |
|--------|---------|---------|
| Promise | `await + try-catch-finally` | 只用await，不混用then |
| 回调 | `标志位 + 循环等待 + finally` | 等待回调完成再done |