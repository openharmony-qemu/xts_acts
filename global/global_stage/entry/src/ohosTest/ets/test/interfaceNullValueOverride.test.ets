import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import sendableResourceManager from '@ohos.sendableResourceManager';
import { GlobalContext } from '../test/global';

export default function interfaceNullValueOverrideTest() {
  describe("interfaceNullValueOverrideTest", () => {
    console.log('*************start interfaceNullValueOverrideTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number   : getString_null_test_0100
     * @tc.name     : getString_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getString_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getString(null, (err: BusinessError, value: string) => {
        console.log('getString_null_test_0100 value:' + value);
        console.log('getString_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001001);
        } catch (e) {
          console.log('getString_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getString_null_test_0200
     * @tc.name     : getString_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getString_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getString(null).then((value: string) => {
        console.log('getString_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getString_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001001);
        } catch (e) {
          console.log('getString_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getStringValue_null_test_0100
     * @tc.name     : getStringValue_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringValue_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringValue(null, (err: BusinessError, value: string) => {
          try {
            console.log('getStringValue_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringValue_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringValue_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringValue_null_test_0200
     * @tc.name     : getStringValue_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringValue_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringValue(null).then((value: string) => {
          try {
            console.log('getStringValue_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringValue_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getStringValue_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringValue_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringArray_null_test_0100
     * @tc.name     : getStringArray_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArray_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getStringArray(null, (err: BusinessError, value: Array<string>) => {
        console.log('getStringArray_null_test_0100 value:' + value);
        console.log('getStringArray_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001003);
        } catch (e) {
          console.log('getStringArray_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getStringArray_null_test_0200
     * @tc.name     : getStringArray_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArray_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getStringArray(null).then((value: Array<string>) => {
        console.log('getStringArray_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getStringArray_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001003);
        } catch (e) {
          console.log('getStringArray_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getStringArrayValue_null_test_0100
     * @tc.name     : getStringArrayValue_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringArrayValue(null, (err: BusinessError, value: Array<string>) => {
          try {
            console.log('getStringArrayValue_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringArrayValue_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringArrayValue_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringArrayValue_null_test_0200
     * @tc.name     : getStringArrayValue_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayValue_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringArrayValue(null).then((value: Array<string>) => {
          try {
            console.log('getStringArrayValue_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringArrayValue_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getStringArrayValue_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringArrayValue_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMedia_null_test_0100
     * @tc.name     : getMedia_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMedia_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getMedia(null, (err: BusinessError, value: Uint8Array) => {
        console.log('getMedia_null_test_0100 value:' + value);
        console.log('getMedia_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001001);
        } catch (e) {
          console.log('getMedia_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMedia_null_test_0200
     * @tc.name     : getMedia_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMedia_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getMedia(null).then((value: Uint8Array) => {
        console.log('getMedia_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getMedia_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001001);
        } catch (e) {
          console.log('getMedia_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaContent_null_test_0100
     * @tc.name     : getMediaContent_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContent(null, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0200
     * @tc.name     : getMediaContent_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContent(null).then((value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0300
     * @tc.name     : getMediaContent_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContent(null, 0, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0400
     * @tc.name     : getMediaContent_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContent(null, 0).then((value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0500
     * @tc.name     : getMediaContent_null_test_0500
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0500', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContent({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        }, null, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0500 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContent_null_test_0500 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0500 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0600
     * @tc.name     : getMediaContent_null_test_0600
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0600', Level.LEVEL3, async (done: Function) => {
      try {
        let Null: number | null = null;
        res.getMediaContent({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        }, Null!).then((value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0600 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContent_null_test_0600 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0600 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0600 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0700
     * @tc.name     : getMediaContent_null_test_0700
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0700', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContent($r('app.media.icon').id, null, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0700 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContent_null_test_0700 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0700 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaContent_null_test_0800
     * @tc.name     : getMediaContent_null_test_0800
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContent_null_test_0800', Level.LEVEL3, async (done: Function) => {
      try {
        let Null: number | null = null;
        res.getMediaContent($r('app.media.icon').id, Null!).then((value: Uint8Array) => {
          try {
            console.log('getMediaContent_null_test_0800 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContent_null_test_0800 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContent_null_test_0800 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContent_null_test_0800 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaBase64_null_test_0100
     * @tc.name     : getMediaBase64_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64(null, (err: BusinessError, value: string) => {
        console.log('getMediaBase64_null_test_0100 value:' + value);
        console.log('getMediaBase64_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001003);
        } catch (e) {
          console.log('getMediaBase64_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64_null_test_0200
     * @tc.name     : getMediaBase64_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64(null).then((value: string) => {
        console.log('getMediaBase64_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getMediaBase64_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001003);
        } catch (e) {
          console.log('getMediaBase64_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0100
     * @tc.name     : getMediaContentBase64_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContentBase64(null, (err: BusinessError, value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0200
     * @tc.name     : getMediaContentBase64_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContentBase64(null).then((value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0300
     * @tc.name     : getMediaContentBase64_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContentBase64(null, 0, (err: BusinessError, value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0400
     * @tc.name     : getMediaContentBase64_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContentBase64(null, 0).then((value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0500
     * @tc.name     : getMediaContentBase64_null_test_0500
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0500', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContentBase64({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        }, null, (err: BusinessError, value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0500 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0500 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0500 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0600
     * @tc.name     : getMediaContentBase64_null_test_0600
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0600', Level.LEVEL3, async (done: Function) => {
      try {
        let Null: number | null = null;
        res.getMediaContentBase64({
          bundleName: "ohos.acts.globalstage",
          moduleName: "entry_test",
          id: $r('app.media.icon').id
        }, Null!).then((value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0600 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0600 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0600 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0600 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0700
     * @tc.name     : getMediaContentBase64_null_test_0700
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0700', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaContentBase64($r('app.media.icon').id, null, (err: BusinessError, value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0700 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0700 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0700 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getMediaContentBase64_null_test_0800
     * @tc.name     : getMediaContentBase64_null_test_0800
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaContentBase64_null_test_0800', Level.LEVEL3, async (done: Function) => {
      try {
        let Null: number | null = null;
        res.getMediaContentBase64($r('app.media.icon').id, Null!).then((value: string) => {
          try {
            console.log('getMediaContentBase64_null_test_0800 value:' + value);
            expect(value != null).assertTrue();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0800 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaContentBase64_null_test_0800 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaContentBase64_null_test_0800 err:' + err.code);
        expect(err.code).assertFail();
        done();
      }
    })

    /**
     * @tc.number   : getPluralString_null_test_0100
     * @tc.name     : getPluralString_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralString_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getPluralString(null, 1, (err: BusinessError, value: string) => {
        console.log('getPluralString_null_test_0100 value:' + value);
        console.log('getPluralString_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001003);
        } catch (e) {
          console.log('getPluralString_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getPluralString_null_test_0200
     * @tc.name     : getPluralString_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralString_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getPluralString(null, 1).then((value: string) => {
        console.log('getPluralString_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getPluralString_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001003);
        } catch (e) {
          console.log('getPluralString_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getPluralString_null_test_0300
     * @tc.name     : getPluralString_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralString_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralString($r('app.plural.plural_name').id, null, (err: BusinessError, value: string) => {
          try {
            console.log('getPluralString_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralString_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralString_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getPluralString_null_test_0400
     * @tc.name     : getPluralString_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralString_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralString($r('app.plural.plural_name').id, null).then((value: string) => {
          try {
            console.log('getPluralString_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralString_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getPluralString_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralString_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getPluralStringValue_null_test_0100
     * @tc.name     : getPluralStringValue_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue(null, 1, (err: BusinessError, value: string) => {
        console.log('getPluralStringValue_null_test_0100 value:' + value);
        console.log('getPluralStringValue_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001003);
        } catch (e) {
          console.log('getPluralStringValue_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_null_test_0200
     * @tc.name     : getPluralStringValue_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getPluralStringValue(null, 1).then((value: string) => {
        console.log('getPluralStringValue_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getPluralStringValue_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001003);
        } catch (e) {
          console.log('getPluralStringValue_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringValue_null_test_0300
     * @tc.name     : getPluralStringValue_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralStringValue($r('app.plural.plural_name').id, null, (err: BusinessError, value: string) => {
          try {
            console.log('getPluralStringValue_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralStringValue_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralStringValue_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getPluralStringValue_null_test_0400
     * @tc.name     : getPluralStringValue_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringValue_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralStringValue($r('app.plural.plural_name').id, null).then((value: string) => {
          try {
            console.log('getPluralStringValue_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralStringValue_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getPluralStringValue_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralStringValue_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getRawFile_null_test_0100
     * @tc.name     : getRawFile_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFile_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getRawFile(null, (err: BusinessError, value: Uint8Array) => {
        console.log('getRawFile_null_test_0100 value:' + value);
        console.log('getRawFile_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001005);
        } catch (e) {
          console.log('getRawFile_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getRawFile_null_test_0200
     * @tc.name     : getRawFile_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFile_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getRawFile(null).then((value: Uint8Array) => {
        console.log('getRawFile_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getRawFile_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001005);
        } catch (e) {
          console.log('getRawFile_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getRawFileDescriptor_null_test_0100
     * @tc.name     : getRawFileDescriptor_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileDescriptor_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.getRawFileDescriptor(null, (err: BusinessError, value: resourceManager.RawFileDescriptor) => {
        console.log('getRawFileDescriptor_null_test_0100 value:' + value);
        console.log('getRawFileDescriptor_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001005);
        } catch (e) {
          console.log('getRawFileDescriptor_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getRawFileDescriptor_null_test_0200
     * @tc.name     : getRawFileDescriptor_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileDescriptor_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.getRawFileDescriptor(null).then((value: resourceManager.RawFileDescriptor) => {
        console.log('getRawFileDescriptor_null_test_0200 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getRawFileDescriptor_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001005);
        } catch (e) {
          console.log('getRawFileDescriptor_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : closeRawFileDescriptor_null_test_0100
     * @tc.name     : closeRawFileDescriptor_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('closeRawFileDescriptor_null_test_0100', Level.LEVEL3, async (done: Function) => {
      res.closeRawFileDescriptor(null, (err: BusinessError) => {
        console.log('closeRawFileDescriptor_null_test_0100 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001005);
        } catch (e) {
          console.log('closeRawFileDescriptor_null_test_0100 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : closeRawFileDescriptor_null_test_0200
     * @tc.name     : closeRawFileDescriptor_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('closeRawFileDescriptor_null_test_0200', Level.LEVEL3, async (done: Function) => {
      res.closeRawFileDescriptor(null).then(() => {
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('closeRawFileDescriptor_null_test_0200 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001005);
        } catch (e) {
          console.log('closeRawFileDescriptor_null_test_0200 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getStringByName_null_test_0100
     * @tc.name     : getStringByName_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringByName(null, (err: BusinessError, value: string) => {
          try {
            console.log('getStringByName_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringByName_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringByName_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringByName_null_test_0200
     * @tc.name     : getStringByName_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByName_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringByName(null).then((value: string) => {
          try {
            console.log('getStringByName_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringByName_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getStringByName_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringByName_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringArrayByName_null_test_0100
     * @tc.name     : getStringArrayByName_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringArrayByName(null, (err: BusinessError, value: Array<string>) => {
          try {
            console.log('getStringArrayByName_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringArrayByName_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringArrayByName_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringArrayByName_null_test_0200
     * @tc.name     : getStringArrayByName_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringArrayByName_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getStringArrayByName(null).then((value: Array<string>) => {
          try {
            console.log('getStringArrayByName_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getStringArrayByName_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getStringArrayByName_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getStringArrayByName_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaByName_null_test_0100
     * @tc.name     : getMediaByName_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaByName(null, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getMediaByName_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaByName_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaByName_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaByName_null_test_0200
     * @tc.name     : getMediaByName_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaByName(null).then((value: Uint8Array) => {
          try {
            console.log('getMediaByName_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaByName_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaByName_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaByName_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaByName_null_test_0300
     * @tc.name     : getMediaByName_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaByName(null, 0, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getMediaByName_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaByName_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaByName_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaByName_null_test_0400
     * @tc.name     : getMediaByName_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaByName(null, 0).then((value: Uint8Array) => {
          try {
            console.log('getMediaByName_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaByName_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaByName_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaByName_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaByName_null_test_0500
     * @tc.name     : getMediaByName_null_test_0500
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_null_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getMediaByName('app.media.icon', null, (err: BusinessError, value: Uint8Array) => {
        console.log('getMediaByName_null_test_0500 value:' + value);
        console.log('getMediaByName_null_test_0500 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001003);
        } catch (e) {
          console.log('getMediaByName_null_test_0500 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaByName_null_test_0600
     * @tc.name     : getMediaByName_null_test_0600
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaByName_null_test_0600', Level.LEVEL3, async (done: Function) => {
      let Null: number | null = null;
      res.getMediaByName('app.media.icon', Null!).then((value: Uint8Array) => {
        console.log('getMediaByName_null_test_0600 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getMediaByName_null_test_0600 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001003);
        } catch (e) {
          console.log('getMediaByName_null_test_0600 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_null_test_0100
     * @tc.name     : getMediaBase64ByName_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaBase64ByName(null, (err: BusinessError, value: string) => {
          try {
            console.log('getMediaBase64ByName_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaBase64ByName_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaBase64ByName_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaBase64ByName_null_test_0200
     * @tc.name     : getMediaBase64ByName_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaBase64ByName(null).then((value: string) => {
          try {
            console.log('getMediaBase64ByName_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaBase64ByName_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaBase64ByName_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaBase64ByName_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaBase64ByName_null_test_0300
     * @tc.name     : getMediaBase64ByName_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaBase64ByName(null, 0, (err: BusinessError, value: string) => {
          try {
            console.log('getMediaBase64ByName_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaBase64ByName_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaBase64ByName_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaBase64ByName_null_test_0400
     * @tc.name     : getMediaBase64ByName_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getMediaBase64ByName(null, 0).then((value: string) => {
          try {
            console.log('getMediaBase64ByName_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getMediaBase64ByName_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getMediaBase64ByName_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getMediaBase64ByName_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getMediaBase64ByName_null_test_0500
     * @tc.name     : getMediaBase64ByName_null_test_0500
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_null_test_0500', Level.LEVEL3, async (done: Function) => {
      res.getMediaBase64ByName('app.media.icon', null, (err: BusinessError, value: string) => {
        console.log('getMediaBase64ByName_null_test_0500 value:' + value);
        console.log('getMediaBase64ByName_null_test_0500 err:' + err.code);
        try {
          expect(err.code).assertEqual(9001003);
        } catch (e) {
          console.log('getMediaBase64ByName_null_test_0500 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getMediaBase64ByName_null_test_0600
     * @tc.name     : getMediaBase64ByName_null_test_0600
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getMediaBase64ByName_null_test_0600', Level.LEVEL3, async (done: Function) => {
      let Null: number | null = null;
      res.getMediaBase64ByName('app.media.icon', Null!).then((value: string) => {
        console.log('getMediaBase64ByName_null_test_0600 value:' + value);
        expect(value).assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.log('getMediaBase64ByName_null_test_0600 error:' + error.code);
        try {
          expect(error.code).assertEqual(9001003);
        } catch (e) {
          console.log('getMediaBase64ByName_null_test_0600 e:' + e);
        }
        done();
      })
    })

    /**
     * @tc.number   : getPluralStringByName_null_test_0100
     * @tc.name     : getPluralStringByName_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralStringByName(null, 1, (err: BusinessError, value: string) => {
          try {
            console.log('getPluralStringByName_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralStringByName_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralStringByName_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getPluralStringByName_null_test_0200
     * @tc.name     : getPluralStringByName_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralStringByName(null, 1).then((value: string) => {
          try {
            console.log('getPluralStringByName_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralStringByName_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getPluralStringByName_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralStringByName_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getPluralStringByName_null_test_0300
     * @tc.name     : getPluralStringByName_null_test_0300
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_null_test_0300', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralStringByName('app.plural.plural_name', null, (err: BusinessError, value: string) => {
          try {
            console.log('getPluralStringByName_null_test_0300 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralStringByName_null_test_0300 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralStringByName_null_test_0300 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getPluralStringByName_null_test_0400
     * @tc.name     : getPluralStringByName_null_test_0400
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getPluralStringByName_null_test_0400', Level.LEVEL3, async (done: Function) => {
      try {
        res.getPluralStringByName('app.plural.plural_name', null).then((value: string) => {
          try {
            console.log('getPluralStringByName_null_test_0400 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getPluralStringByName_null_test_0400 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getPluralStringByName_null_test_0400 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getPluralStringByName_null_test_0400 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getStringSync_null_test_0100
     * @tc.name     : getStringSync_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getStringSync(null);
        console.log('getStringSync_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringSync_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getStringSync_null_test_0200
     * @tc.name     : getStringSync_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getStringSync(null, 0);
        console.log('getStringSync_null_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringSync_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getStringSync_null_test_0300
     * @tc.name     : getStringSync_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getStringSync($r('app.string.test_stringOne').id, null);
        console.log('getStringSync_null_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringSync_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number   : getStringSync_null_test_0400
     * @tc.name     : getStringSync_null_test_0400
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringSync_null_test_0400', Level.LEVEL3, () => {
      try {
        let value = res.getStringSync($r('app.string.test_stringOne'), null);
        console.log('getStringSync_null_test_0400 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringSync_null_test_0400 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number   : getStringByNameSync_null_test_0100
     * @tc.name     : getStringByNameSync_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getStringByNameSync(null);
        console.log('getStringByNameSync_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringByNameSync_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getStringByNameSync_null_test_0200
     * @tc.name     : getStringByNameSync_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getStringByNameSync(null, 0);
        console.log('getStringByNameSync_null_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringByNameSync_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getStringByNameSync_null_test_0300
     * @tc.name     : getStringByNameSync_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getStringByNameSync_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getStringByNameSync('test_stringOne', null);
        console.log('getStringByNameSync_null_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getStringByNameSync_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001008);
      }
    })

    /**
     * @tc.number   : getBoolean_null_test_0100
     * @tc.name     : getBoolean_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBoolean_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getBoolean(null);
        console.log('getBoolean_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getBoolean_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getBooleanByName_null_test_0100
     * @tc.name     : getBooleanByName_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getBooleanByName_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getBooleanByName(null);
        console.log('getBooleanByName_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getBooleanByName_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getNumber_null_test_0100
     * @tc.name     : getNumber_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumber_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getNumber(null);
        console.log('getNumber_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getNumber_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getNumberByName_null_test_0100
     * @tc.name     : getNumberByName_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getNumberByName_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getNumberByName(null);
        console.log('getNumberByName_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getNumberByName_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getIntPluralStringValueSync_null_test_0100
     * @tc.name     : getIntPluralStringValueSync_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringValueSync_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringValueSync(null, 0, 10);
        console.log('getIntPluralStringValueSync_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringValueSync_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getIntPluralStringValueSync_null_test_0200
     * @tc.name     : getIntPluralStringValueSync_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringValueSync_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringValueSync($r('app.plural.plural_name').id, null, 10);
        console.log('getIntPluralStringValueSync_null_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringValueSync_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getIntPluralStringValueSync_null_test_0300
     * @tc.name     : getIntPluralStringValueSync_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringValueSync_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringValueSync($r('app.plural.plural_name').id, 0, null);
        console.log('getIntPluralStringValueSync_null_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringValueSync_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number   : getIntPluralStringValueSync_null_test_0400
     * @tc.name     : getIntPluralStringValueSync_null_test_0400
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringValueSync_null_test_0400', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringValueSync($r('app.plural.plural_name'), null, 10);
        console.log('getIntPluralStringValueSync_null_test_0400 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringValueSync_null_test_0400 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getIntPluralStringValueSync_null_test_0500
     * @tc.name     : getIntPluralStringValueSync_null_test_0500
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringValueSync_null_test_0500', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringValueSync($r('app.plural.plural_name'), 0, null);
        console.log('getIntPluralStringValueSync_null_test_0500 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringValueSync_null_test_0500 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number   : getIntPluralStringByNameSync_null_test_0100
     * @tc.name     : getIntPluralStringByNameSync_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringByNameSync_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringByNameSync(null, 0, 10);
        console.log('getIntPluralStringByNameSync_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringByNameSync_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getIntPluralStringByNameSync_null_test_0200
     * @tc.name     : getIntPluralStringByNameSync_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringByNameSync_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringByNameSync('plural_name', null, 10);
        console.log('getIntPluralStringByNameSync_null_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringByNameSync_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getIntPluralStringByNameSync_null_test_0300
     * @tc.name     : getIntPluralStringByNameSync_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getIntPluralStringByNameSync_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getIntPluralStringByNameSync('plural_name', 0, null);
        console.log('getIntPluralStringByNameSync_null_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getIntPluralStringByNameSync_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001008);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringValueSync_null_test_0100
     * @tc.name     : getDoublePluralStringValueSync_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringValueSync_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringValueSync(null, 1.1, 10);
        console.log('getDoublePluralStringValueSync_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringValueSync_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringValueSync_null_test_0200
     * @tc.name     : getDoublePluralStringValueSync_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringValueSync_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringValueSync($r('app.plural.plural_name').id, null, 10);
        console.log('getDoublePluralStringValueSync_null_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringValueSync_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringValueSync_null_test_0300
     * @tc.name     : getDoublePluralStringValueSync_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringValueSync_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringValueSync($r('app.plural.plural_name').id, 1.1, null);
        console.log('getDoublePluralStringValueSync_null_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringValueSync_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringValueSync_null_test_0400
     * @tc.name     : getDoublePluralStringValueSync_null_test_0400
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringValueSync_null_test_0400', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringValueSync($r('app.plural.plural_name'), null, 10);
        console.log('getDoublePluralStringValueSync_null_test_0400 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringValueSync_null_test_0400 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringValueSync_null_test_0500
     * @tc.name     : getDoublePluralStringValueSync_null_test_0500
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringValueSync_null_test_0500', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringValueSync($r('app.plural.plural_name'), 1.1, null);
        console.log('getDoublePluralStringValueSync_null_test_0500 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringValueSync_null_test_0500 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001007);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringByNameSync_null_test_0100
     * @tc.name     : getDoublePluralStringByNameSync_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringByNameSync_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringByNameSync(null, 1.1, 10);
        console.log('getDoublePluralStringByNameSync_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringByNameSync_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringByNameSync_null_test_0200
     * @tc.name     : getDoublePluralStringByNameSync_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringByNameSync_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringByNameSync('plural_name', null, 10);
        console.log('getDoublePluralStringByNameSync_null_test_0200 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringByNameSync_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDoublePluralStringByNameSync_null_test_0300
     * @tc.name     : getDoublePluralStringByNameSync_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDoublePluralStringByNameSync_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getDoublePluralStringByNameSync('plural_name', 1.1, null);
        console.log('getDoublePluralStringByNameSync_null_test_0300 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDoublePluralStringByNameSync_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertEqual(9001008);
      }
    })

    /**
     * @tc.number   : getRawFileContent_null_test_0100
     * @tc.name     : getRawFileContent_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContent_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getRawFileContent(null, (err: BusinessError, value: Uint8Array) => {
          try {
            console.log('getRawFileContent_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getRawFileContent_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getRawFileContent_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getRawFileContent_null_test_0200
     * @tc.name     : getRawFileContent_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileContent_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getRawFileContent(null).then((value: Uint8Array) => {
          try {
            console.log('getRawFileContent_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getRawFileContent_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getRawFileContent_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getRawFileContent_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getRawFd_null_test_0100
     * @tc.name     : getRawFd_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFd_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getRawFd(null, (err: BusinessError, value: resourceManager.RawFileDescriptor) => {
          try {
            console.log('getRawFd_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getRawFd_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getRawFd_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getRawFd_null_test_0200
     * @tc.name     : getRawFd_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFd_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getRawFd(null).then((value: resourceManager.RawFileDescriptor) => {
          try {
            console.log('getRawFd_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getRawFd_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getRawFd_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getRawFd_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : closeRawFd_null_test_0100
     * @tc.name     : closeRawFd_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('closeRawFd_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.closeRawFd(null, (err: BusinessError, value: void) => {
          try {
            console.log('closeRawFd_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('closeRawFd_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('closeRawFd_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : closeRawFd_null_test_0200
     * @tc.name     : closeRawFd_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('closeRawFd_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.closeRawFd(null).then((value: void) => {
          try {
            console.log('closeRawFd_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('closeRawFd_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('closeRawFd_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('closeRawFd_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_null_test_0100
     * @tc.name     : getDrawableDescriptor_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getDrawableDescriptor(null, 0, 0);
        console.log('getDrawableDescriptor_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDrawableDescriptor_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_null_test_0200
     * @tc.name     : getDrawableDescriptor_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getDrawableDescriptor($r('app.media.icon').id, 0, null);
        console.log('getDrawableDescriptor_null_test_0200 value:' + value);
        expect(value != null).assertTrue();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDrawableDescriptor_null_test_0200 err:' + error.code);
        expect(error.code).assertFail();
      }
    })

    /**
     * @tc.number   : getDrawableDescriptor_null_test_0300
     * @tc.name     : getDrawableDescriptor_null_test_0300
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptor_null_test_0300', Level.LEVEL3, () => {
      try {
        let value = res.getDrawableDescriptor($r('app.media.icon'), 0, null);
        console.log('getDrawableDescriptor_null_test_0300 value:' + value);
        expect(value != null).assertTrue();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDrawableDescriptor_null_test_0300 err:' + error.code);
        expect(Number(error.code)).assertFail();
      }
    })

    /**
     * @tc.number   : getDrawableDescriptorByName_null_test_0100
     * @tc.name     : getDrawableDescriptorByName_null_test_0100
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptorByName_null_test_0100', Level.LEVEL3, () => {
      try {
        let value = res.getDrawableDescriptorByName(null, 0, 0);
        console.log('getDrawableDescriptorByName_null_test_0100 value:' + value);
        expect(value).assertFail();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDrawableDescriptorByName_null_test_0100 err:' + error.code);
        expect(Number(error.code)).assertEqual(401);
      }
    })

    /**
     * @tc.number   : getDrawableDescriptorByName_null_test_0200
     * @tc.name     : getDrawableDescriptorByName_null_test_0200
     * @tc.desc     : with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getDrawableDescriptorByName_null_test_0200', Level.LEVEL3, () => {
      try {
        let value = res.getDrawableDescriptorByName('icon', 0, null);
        console.log('getDrawableDescriptorByName_null_test_0200 value:' + value);
        expect(value != null).assertTrue();
      } catch (e) {
        let error = e as BusinessError;
        console.log('getDrawableDescriptorByName_null_test_0200 err:' + error.code);
        expect(Number(error.code)).assertFail();
      }
    })


    /**
     * @tc.number   : getRawFileList_null_test_0100
     * @tc.name     : getRawFileList_null_test_0100
     * @tc.desc     : callback mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileList_null_test_0100', Level.LEVEL3, async (done: Function) => {
      try {
        res.getRawFileList(null, (err: BusinessError, value: Array<string>) => {
          try {
            console.log('getRawFileList_null_test_0100 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getRawFileList_null_test_0100 e:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getRawFileList_null_test_0100 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   : getRawFileList_null_test_0200
     * @tc.name     : getRawFileList_null_test_0200
     * @tc.desc     : promise mode with NULL
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('getRawFileList_null_test_0200', Level.LEVEL3, async (done: Function) => {
      try {
        res.getRawFileList(null).then((value: Array<string>) => {
          try {
            console.log('getRawFileList_null_test_0200 value:' + value);
            expect(value).assertFail();
          } catch (e) {
            console.log('getRawFileList_null_test_0200 then:' + e);
          }
          done();
        }).catch((error: BusinessError) => {
          try {
            expect(error).assertFail();
          } catch (e) {
            console.log('getRawFileList_null_test_0200 catch:' + e);
          }
          done();
        })
      } catch (error) {
        let err = error as BusinessError;
        console.log('getRawFileList_null_test_0200 err:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }


      /**
       * @tc.number   : getColor_null_test_0100
       * @tc.name     : getColor_null_test_0100
       * @tc.desc     : callback mode with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getColor_null_test_0100', Level.LEVEL3, async (done: Function) => {
        try {
          res.getColor(null, (err: BusinessError, value: number) => {
            try {
              console.log('getColor_null_test_0100 value:' + value);
              expect(value).assertFail();
            } catch (e) {
              console.log('getColor_null_test_0100 e:' + e);
            }
            done();
          })
        } catch (error) {
          let err = error as BusinessError;
          console.log('getColor_null_test_0100 err:' + err.code);
          expect(Number(err.code)).assertEqual(401);
          done();
        }
      })

      /**
       * @tc.number   : getColor_null_test_0200
       * @tc.name     : getColor_null_test_0200
       * @tc.desc     : promise mode with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getColor_null_test_0200', Level.LEVEL3, async (done: Function) => {
        try {
          res.getColor(null).then((value: number) => {
            try {
              console.log('getColor_null_test_0200 value:' + value);
              expect(value).assertFail();
            } catch (e) {
              console.log('getColor_null_test_0200 then:' + e);
            }
            done();
          }).catch((error: BusinessError) => {
            try {
              expect(error).assertFail();
            } catch (e) {
              console.log('getColor_null_test_0200 catch:' + e);
            }
            done();
          })
        } catch (error) {
          let err = error as BusinessError;
          console.log('getStringValue_null_test_0200 err:' + err.code);
          expect(Number(err.code)).assertEqual(401);
          done();
        }
      })

      /**
       * @tc.number   : getColorByName_null_test_0100
       * @tc.name     : getColorByName_null_test_0100
       * @tc.desc     : callback mode with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getColorByName_null_test_0100', Level.LEVEL3, async (done: Function) => {
        try {
          res.getColorByName(null, (err: BusinessError, value: number) => {
            try {
              console.log('getColorByName_null_test_0100 value:' + value);
              expect(value).assertFail();
            } catch (e) {
              console.log('getColorByName_null_test_0100 e:' + e);
            }
            done();
          })
        } catch (error) {
          let err = error as BusinessError;
          console.log('getColorByName_null_test_0100 err:' + err.code);
          expect(Number(err.code)).assertEqual(401);
          done();
        }
      })

      /**
       * @tc.number   : getColor_null_test_0200
       * @tc.name     : getColor_null_test_0200
       * @tc.desc     : promise mode with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getColorByName_null_test_0200', Level.LEVEL3, async (done: Function) => {
        try {
          res.getColorByName(null).then((value: number) => {
            try {
              console.log('getColorByName_null_test_0200 value:' + value);
              expect(value).assertFail();
            } catch (e) {
              console.log('getColorByName_null_test_0200 then:' + e);
            }
            done();
          }).catch((error: BusinessError) => {
            try {
              expect(error).assertFail();
            } catch (e) {
              console.log('getColorByName_null_test_0200 catch:' + e);
            }
            done();
          })
        } catch (error) {
          let err = error as BusinessError;
          console.log('getColorByName_null_test_0200 err:' + err.code);
          expect(Number(err.code)).assertEqual(401);
          done();
        }
      })


      /**
       * @tc.number   : getColorByName_null_test_0100
       * @tc.name     : getColorByName_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getColorSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getColorSync(null);
          console.log('getColorSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getColorSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getColorByNameSync_null_test_0100
       * @tc.name     : getColorByNameSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getColorByNameSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getColorByNameSync(null);
          console.log('getColorByNameSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getColorByNameSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : addResource_null_test_0100
       * @tc.name     : addResource_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('addResource_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.addResource(null);
          console.log('addResource_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('addResource_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : removeResource_null_test_0100
       * @tc.name     : removeResource_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('removeResource_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.removeResource(null);
          console.log('removeResource_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('removeResource_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getRawFdSync_null_test_0100
       * @tc.name     : getRawFdSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getRawFdSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getRawFdSync(null);
          console.log('getRawFdSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getRawFdSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : closeRawFdSync_null_test_0100
       * @tc.name     : closeRawFdSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('closeRawFdSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.closeRawFdSync(null);
          console.log('closeRawFdSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('closeRawFdSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getRawFileListSync_null_test_0100
       * @tc.name     : getRawFileListSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getRawFileListSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getRawFileListSync(null);
          console.log('getRawFileListSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getRawFileListSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getRawFileContentSync_null_test_0100
       * @tc.name     : getRawFileContentSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getRawFileContentSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getRawFileContentSync(null);
          console.log('getRawFileContentSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getRawFileContentSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getMediaContentSync_null_test_0100
       * @tc.name     : getMediaContentSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaContentSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getMediaContentSync(null, 0);
          console.log('getMediaContentSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaContentSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getMediaContentSync_null_test_0200
       * @tc.name     : getMediaContentSync_null_test_0200
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaContentSync_null_test_0200', Level.LEVEL3, () => {
        try {
          let value = res.getMediaContentSync($r('app.media.icon').id, null);
          console.log('getMediaContentSync_null_test_0200 value:' + value);
          expect(value != null).assertTrue();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaContentSync_null_test_0200 err:' + error.code);
          expect(Number(error.code)).assertFail();
        }
      })

      /**
       * @tc.number   : getMediaContentSync_null_test_0300
       * @tc.name     : getMediaContentSync_null_test_0300
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaContentSync_null_test_0300', Level.LEVEL3, () => {
        try {
          let value = res.getMediaContentSync($r('app.media.icon'), null);
          console.log('getMediaContentSync_null_test_0300 value:' + value);
          expect(value != null).assertTrue();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaContentSync_null_test_0300 err:' + error.code);
          expect(Number(error.code)).assertFail();
        }
      })

      /**
       * @tc.number   : getMediaContentBase64Sync_null_test_0100
       * @tc.name     : getMediaContentBase64Sync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaContentBase64Sync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getMediaContentBase64Sync(null, 0);
          console.log('getMediaContentBase64Sync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaContentBase64Sync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getMediaContentBase64Sync_null_test_0200
       * @tc.name     : getMediaContentBase64Sync_null_test_0200
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaContentBase64Sync_null_test_0200', Level.LEVEL3, () => {
        try {
          let value = res.getMediaContentBase64Sync($r('app.media.icon').id, null);
          console.log('getMediaContentBase64Sync_null_test_0200 value:' + value);
          expect(value != null).assertTrue();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaContentBase64Sync_null_test_0200 err:' + error.code);
          expect(Number(error.code)).assertFail();
        }
      })

      /**
       * @tc.number   : getMediaContentBase64Sync_null_test_0300
       * @tc.name     : getMediaContentBase64Sync_null_test_0300
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaContentBase64Sync_null_test_0300', Level.LEVEL3, () => {
        try {
          let value = res.getMediaContentBase64Sync($r('app.media.icon'), null);
          console.log('getMediaContentBase64Sync_null_test_0300 value:' + value);
          expect(value != null).assertTrue();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaContentBase64Sync_null_test_0300 err:' + error.code);
          expect(Number(error.code)).assertFail();
        }
      })


      /**
       * @tc.number   : getPluralStringValueSync_null_test_0100
       * @tc.name     : getPluralStringValueSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getPluralStringValueSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getPluralStringValueSync(null, 1);
          console.log('getPluralStringValueSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getPluralStringValueSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getPluralStringValueSync_null_test_0200
       * @tc.name     : getPluralStringValueSync_null_test_0200
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getPluralStringValueSync_null_test_0200', Level.LEVEL3, () => {
        try {
          let value = res.getPluralStringValueSync($r('app.plural.plural_name').id, null);
          console.log('getPluralStringValueSync_null_test_0200 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getPluralStringValueSync_null_test_0200 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getPluralStringValueSync_null_test_0300
       * @tc.name     : getPluralStringValueSync_null_test_0300
       * @tc.desc     : NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getPluralStringValueSync_null_test_0300', Level.LEVEL3, () => {
        try {
          let value = res.getPluralStringValueSync($r('app.plural.plural_name'), null);
          console.log('getPluralStringValueSync_null_test_0300 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getPluralStringValueSync_null_test_0300 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getStringArrayValueSync_null_test_0100
       * @tc.name     : getStringArrayValueSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getStringArrayValueSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getStringArrayValueSync(null);
          console.log('getStringArrayValueSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getStringArrayValueSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getPluralStringByNameSync_null_test_0100
       * @tc.name     : getPluralStringByNameSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getPluralStringByNameSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getPluralStringByNameSync(null, 1);
          console.log('getPluralStringByNameSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getPluralStringByNameSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getPluralStringByNameSync_null_test_0200
       * @tc.name     : getPluralStringByNameSync_null_test_0200
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getPluralStringByNameSync_null_test_0200', Level.LEVEL3, () => {
        try {
          let value = res.getPluralStringByNameSync('plural_name', null);
          console.log('getPluralStringByNameSync_null_test_0200 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getPluralStringByNameSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getMediaByNameSync_null_test_0100
       * @tc.name     : getMediaByNameSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaByNameSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getMediaByNameSync(null, 0);
          console.log('getMediaByNameSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaByNameSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getMediaByNameSync_null_test_0200
       * @tc.name     : getMediaByNameSync_null_test_0200
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaByNameSync_null_test_0200', Level.LEVEL3, () => {
        try {
          let value = res.getMediaByNameSync('icon', null);
          console.log('getMediaByNameSync_null_test_0200 value:' + value);
          expect(value != null).assertTrue();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaByNameSync_null_test_0200 err:' + error.code);
          expect(error.code).assertFail();
        }
      })

      /**
       * @tc.number   : getMediaBase64ByNameSync_null_test_0100
       * @tc.name     : getMediaBase64ByNameSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaBase64ByNameSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getMediaBase64ByNameSync(null, 0);
          console.log('getMediaBase64ByNameSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaBase64ByNameSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getMediaBase64ByNameSync_null_test_0200
       * @tc.name     : getMediaBase64ByNameSync_null_test_0200
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getMediaBase64ByNameSync_null_test_0200', Level.LEVEL3, () => {
        try {
          let value = res.getMediaBase64ByNameSync('icon', null);
          console.log('getMediaBase64ByNameSync_null_test_0200 value:' + value);
          expect(value != null).assertTrue();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getMediaBase64ByNameSync_null_test_0200 err:' + error.code);
          expect(error.code).assertFail();
        }
      })

      /**
       * @tc.number   : getStingArrayByNameSync_null_test_0100
       * @tc.name     : getStingArrayByNameSync_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getStingArrayByNameSync_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getStingArrayByNameSync(null);
          console.log('getStingArrayByNameSync_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getStingArrayByNameSync_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getSymbol_null_test_0100
       * @tc.name     : getSymbol_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getSymbol_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getSymbol(null);
          console.log('getSymbol_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getSymbol_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : getSymbolByName_null_test_0100
       * @tc.name     : getSymbolByName_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('getSymbolByName_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.getSymbolByName(null);
          console.log('getSymbolByName_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('getSymbolByName_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : isRawDir_null_test_0100
       * @tc.name     : isRawDir_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('isRawDir_null_test_0100', Level.LEVEL3, () => {
        try {
          let value = res.isRawDir(null);
          console.log('isRawDir_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('isRawDir_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : resourceToSendableResource_null_test_0100
       * @tc.name     : resourceToSendableResource_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('resourceToSendableResource_null_test_0100', Level.LEVEL3, () => {
        try {
          let resource: resourceManager.Resource | null = null;
          let value = sendableResourceManager.resourceToSendableResource(resource!);
          console.log('resourceToSendableResource_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('resourceToSendableResource_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      /**
       * @tc.number   : sendableReSourceToResource_null_test_0100
       * @tc.name     : sendableReSourceToResource_null_test_0100
       * @tc.desc     : with NULL
       * @tc.size     : MEDIUM
       * @tc.type     : Function
       * @tc.level    : Level 3
       */
      it('sendableReSourceToResource_null_test_0100', Level.LEVEL3, () => {
        try {
          let resource: sendableResourceManager.SendableResource | null = null;
          let value = sendableResourceManager.sendableReSourceToResource(resource!);
          console.log('sendableReSourceToResource_null_test_0100 value:' + value);
          expect(value).assertFail();
        } catch (e) {
          let error = e as BusinessError;
          console.log('sendableReSourceToResource_null_test_0100 err:' + error.code);
          expect(Number(error.code)).assertEqual(401);
        }
      })

      console.log('*************end interfaceNullValueOverrideTest*************');
    })
  }