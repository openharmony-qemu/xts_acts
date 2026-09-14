import { webview } from '@kit.ArkWeb'
import { fileIo as fs } from '@kit.CoreFileKit'
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { Driver, MouseButton, ON, On } from '@kit.TestKit';
let driver = Driver.create();
const EVENT_ID_SET_SUITE_KEY = 183129;

@Entry
@Component
struct Summarizer {
  controller: webview.WebviewController = new webview.WebviewController()
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State AiSessionOptionsAttribute: null | undefined | [] = []

  
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }


  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  transmitText(
    text: string,
    callback: (char: string) => void,
    finCallback: () => void,
    delay: number = 10
  ): void {
    let index = 0;

    const interval = setInterval(() => {
      if (index >= text.length) {
        finCallback();
        clearInterval(interval);
        return;
      }

      callback(text[index]);
      index++;
    }, delay);
  }

  languageModel: AISessionEvent = {
    aiSessionType: AISessionType.PROMPT,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250420);
      console.info(`lichenwei: PROMPT onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: PROMPT onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      Utils.emitEvent('onExecuteAIAction', 20250421);
      console.info(`lichenwei: PROMPT onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`LLM：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAIAction', 20250422);
      setTimeout(() => {
        console.info(`lichenwei: PROMPT onDestroyAISession, id = ${id}`)
      }, 1000)
    }
  }
  languageDetector: AISessionEvent = {
    aiSessionType: AISessionType.LANGUAGE_DETECTOR,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250423);
      console.info(`lichenwei: LANGUAGE_DETECTOR onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: LANGUAGE_DETECTOR onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: LANGUAGE_DETECTOR onExecuteAIAction, id = ${id}, params = ${params}`)
      result(AISessionResultType.SUCCESS, `[{"language": "en", "score": 0.689}, {"language": "zh", "score": 0.310}]`);
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250424);
      console.info(`lichenwei: LANGUAGE_DETECTOR onDestroyAISession, id = ${id}`)
    }
  }
  proofreader: AISessionEvent = {
    aiSessionType: AISessionType.PROOFREADER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250425);
      console.info(`lichenwei: PROOFREADER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: PROOFREADER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: PROOFREADER onExecuteAIAction, id = ${id}, params = ${params}`)
      let obj = JSON.parse(params) as object
      if (obj['correctedInput'] && obj['correction']) {
        result(AISessionResultType.SUCCESS, `{"label": "Spelling"}`);
      } else {
        this.transmitText(`校对：${params}`,
          (char: string) => {
            result(AISessionResultType.RUNNING, char);
          },
          () => {
            result(AISessionResultType.SUCCESS, "");
          });
      }
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250426);
      console.info(`lichenwei: PROOFREADER onDestroyAISession, id = ${id}`)
    }
  }
  writer: AISessionEvent = {
    aiSessionType: AISessionType.WRITER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250427);
      console.info(`lichenwei: WRITER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: WRITER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: WRITER onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`写作：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250428);
      console.info(`lichenwei: WRITER onDestroyAISession, id = ${id}`)
    }
  }
  rewriter: AISessionEvent = {
    aiSessionType: AISessionType.REWRITER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250429);
      console.info(`lichenwei: REWRITER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: REWRITER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: REWRITER onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`总结：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250430);
      console.info(`lichenwei: REWRITER onDestroyAISession, id = ${id}`)
    }
  }
  translator: AISessionEvent = {
    aiSessionType: AISessionType.TRANSLATOR,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      console.info(`lichenwei: TRANSLATOR onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: TRANSLATOR onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      Utils.emitEvent('onExecuteAIAction', 20250431);
      console.info(`lichenwei: TRANSLATOR onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`翻译：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      console.info(`lichenwei: TRANSLATOR onDestroyAISession, id = ${id}`)
    }
  }
  summarizer: AISessionEvent = {
    aiSessionType: AISessionType.SUMMARIZER,
    onCreateAISession: (id: string, params: string, result: OnAISessionCallback): boolean => {
      Utils.emitEvent('onCreateAISession', 20250432);
      console.info(`lichenwei: SUMMARIZER onCreateAISession, id = ${id}, params = ${params}`)
      setTimeout(() => {
        result(AISessionResultType.SUCCESS, 'lichenwei: SUMMARIZER onCreateAISession, success')
      }, 1000)
      return true
    },
    onExecuteAIAction: (id: string, params: string, result: OnAISessionCallback): void => {
      console.info(`lichenwei: SUMMARIZER onExecuteAIAction, id = ${id}, params = ${params}`)
      this.transmitText(`总结：${params}`,
        (char: string) => {
          result(AISessionResultType.RUNNING, char);
        },
        () => {
          result(AISessionResultType.SUCCESS, "");
        });
    },
    onDestroyAISession: (id: string): void => {
      Utils.emitEvent('onDestroyAISession', 20250433);
      console.info(`lichenwei: SUMMARIZER onDestroyAISession, id = ${id}`)
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewAISessionTypeNullUndefinedButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000, 5);
          switch (this.str) {
            case "emitWebViewAiSessionOptions01": {
              try {
                  this.AiSessionOptionsAttribute = null;
                  Utils.emitEvent(true, 20260520);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewAiSessionOptions02": {
              try {
                this.AiSessionOptionsAttribute = undefined;
                Utils.emitEvent(true, 20260521);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebViewAiSessionOptions03": {
              try {
                this.AiSessionOptionsAttribute = [];
                Utils.emitEvent(true, 20260522);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({
        src: $rawfile("navigation.html"),
        controller: this.controller
      })
        .javaScriptAccess(true)
        .aiSessionOptions(this.AiSessionOptionsAttribute)
        .onPageEnd(()=>{
          this.isPageEnd = 1;
        })
    }
  }
}