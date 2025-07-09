#include <cstdint>
#include <functional>
#include <atomic>
#include "ffrt/fiber.h"

namespace ffrt {

namespace detail {
    static constexpr uint64_t cacheline_size = 64;

    struct non_copyable {
    protected:
        non_copyable() = default;
        ~non_copyable() = default;
        non_copyable(const non_copyable&) = delete;
        non_copyable& operator=(const non_copyable&) = delete;
    };
}

template <int UsageId = 0, class FiberLocal = char, class ThreadLocal = char>
struct fiber : detail::non_copyable {

    struct thread_env :  detail::non_copyable {
        fiber* cur = nullptr;
        bool (*cond)(void*) = nullptr;
        ThreadLocal tl;
    };

    static __attribute__((noinline)) thread_env& env()
    {
        static thread_local thread_env ctx;
        return ctx;
    }

    static fiber* init(std::function<void()>&& f, void* stack, size_t stack_size)
    {
        if (stack == nullptr || stack_size < sizeof(fiber) + min_stack_size) {
            return nullptr;
        }
        auto c = new (stack) fiber(std::forward<std::function<void()>>(f));
        if (ffrt_fiber_init(&c->fb, reinterpret_cast<void(*)(void*)>(fiber_entry), c,
            static_cast<char*>(stack) + sizeof(fiber), stack_size - sizeof(fiber))) {
            c->~fiber<UsageId, FiberLocal, ThreadLocal>();
            return nullptr;
        }
        return c;
    }

    inline void destroy()
    {
        this->~fiber<UsageId, FiberLocal, ThreadLocal>();
    }

    bool start()
    {
        bool done;
        auto& e = fiber::env();

        do {
            e.cond = nullptr;
            e.cur = this;
            ffrt_fiber_switch(&link, &fb);
            done = this->done;
        } while (e.cond && !(e.cond)(this));
        e.cond = nullptr;
        return done;
    }

    template<bool is_final = false>
    static inline void suspend(thread_env& e, bool (*cond)(void*) = nullptr)
    {
        auto j = e.cur;
        if constexpr(is_final) {
            j->done = true;
        } else {
            e.cond = cond;
        }
        e.cur = nullptr;

        ffrt_fiber_switch(&j->fb, &j->link);
    }

    template<bool is_final = false>
    static inline void suspend(bool (*cond)(void*) = nullptr)
    {
        suspend<is_final>(fiber::env(), cond);
    }

    FiberLocal& local()
    {
        return local_;
    }

    uint64_t id;

    static constexpr uint64_t min_stack_size = 32;

    fiber(std::function<void()>&& f)
    {
        fn = std::forward<std::function<void()>>(f);
        id = idx.fetch_add(1, std::memory_order_relaxed);
    }

    static void fiber_entry(fiber* c)
    {
        c->fn();
        c->fn = nullptr;
        suspend<true>();
    }

    ffrt_fiber_t fb;
    ffrt_fiber_t link;
    std::function<void()> fn;
    bool done = false;
    FiberLocal local_;
    static inline std::atomic_uint64_t idx{0};
};

template <typename T>
struct type_size {
    static constexpr size_t value = sizeof(T);
};
template <>
struct type_size<void> {
    static constexpr size_t value = 0;
};
}