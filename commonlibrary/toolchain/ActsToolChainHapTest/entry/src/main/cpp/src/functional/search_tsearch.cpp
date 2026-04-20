#ifndef _XOPEN_SOURCE
#define _XOPEN_SOURCE 700
#endif
#include <cstdlib>
#include <cstring>
#include <search.h>
#include "test.h"

#define TEST_VALUE_1 1
#define TEST_VALUE_2 2
#define TEST_VALUE_3 3
#define TEST_VALUE_4 4
#define TEST_VALUE_5 5
#define TEST_VALUE_6 6
#define TEST_VALUE_7 7
#define TEST_VALUE_8 8
#define TEST_VALUE_9 9

#define TABLE_SIZE 100

struct e {
    char *k;
    int v;
};

static int g_count;
static void *g_root;
static struct e g_tab[TABLE_SIZE];
static struct e *g_cur = g_tab;

static int Cmp(const void *a, const void *b)
{
    return strcmp(static_cast<const struct e*>(a)->k, static_cast<const struct e*>(b)->k);
}

static int g_wantc = 'a';
static void Act(const void *node, VISIT v, int d)
{
    struct e *e = *static_cast<struct e **>(const_cast<void *>(node));

    if (v == preorder) {
        if (e->k[0] < g_wantc) {
            t_error("preorder visited node \"%s\" before \"%c\"\n", e->k, g_wantc);
        }
    }
    if (v == endorder) {
        if (e->k[0] > g_wantc) {
            t_error("endorder visited node \"%s\" after \"%c\"\n", e->k, g_wantc);
        }
    }
    if (v == postorder) {
        if (e->k[0] != g_wantc) {
            t_error("postorder visited node \"%s\", wanted \"%c\"\n", e->k, g_wantc);
        }
    }
    if (v == leaf) {
        if (e->k[0] != g_wantc) {
            t_error("visited leaf node \"%s\", wanted \"%c\"\n", e->k, g_wantc);
        }
    }
    if (v == postorder || v == leaf) {
        g_wantc++;
    }
}

static const void *g_parent;
static char *g_searchkey;
static void GetParent(const void *node, VISIT v, int d)
{
    static const void *p;
    struct e *e = *(struct e**)node;

    if (v == preorder || v == leaf) {
        if (strcmp(g_searchkey, e->k) == 0) {
            g_parent = p;
        }
    }
    if (v == preorder || v == postorder) {
        p = node;
    }
}

struct e *Get(char *k)
{
    struct e key = {.k = k};
    void **p = static_cast<void**>(tfind(&key, &g_root, Cmp));
    if (!p) {
        return nullptr;
    }
    return static_cast<struct e*>(*p);
}

struct e *Set(char *k, int v)
{
    void **p;
    g_cur->k = k;
    g_cur->v = v;
    if (!Get(k)) {
        g_count++;
    }
    p = static_cast<void**>(tsearch(g_cur++, &g_root, Cmp));
    if (!p || strcmp(((struct e*)*p)->k, k) != 0) {
        t_error("tsearch %s %d failed\n", k, v);
    }
    if (!p) {
        g_count--;
        return nullptr;
    }
    return static_cast<struct e*>(*p);
}

void *DelFunc(char *k)
{
    struct e key = {.k = k};
    void *p = tdelete(&key, &g_root, Cmp);
    if (p) {
        g_count--;
    }
    return p;
}

static int SearchTsearchTestImpl()
{
    struct e *e;
    void *p;

    Set("f", TEST_VALUE_6);
    Set("b", TEST_VALUE_2);
    Set("c", TEST_VALUE_3);
    Set("e", TEST_VALUE_5);
    Set("h", TEST_VALUE_8);
    Set("g", TEST_VALUE_7);
    Set("a", TEST_VALUE_1);
    Set("d", TEST_VALUE_4);

    e = Get("a");
    if (!e || e->v != TEST_VALUE_1) {
        t_error("tfind a failed\n");
    }
    if (Get("z")) {
        t_error("tfind z should fail\n");
    }
    e = Set("g", TEST_VALUE_9);
    if (e && e->v != TEST_VALUE_7) {
        t_error("tsearch g 9 returned data %d, wanted 7\n", e->v);
    }
    e = Set("g", TEST_VALUE_9);
    if (e && e->v != TEST_VALUE_7) {
        t_error("tsearch g 9 returned data %d, wanted 7\n", e->v);
    }
    e = Set("i", TEST_VALUE_9);
    if (e && e->v != TEST_VALUE_9) {
        t_error("tsearch i 9 returned data %d, wanted 9\n", e->v);
    }
    if (DelFunc("foobar")) {
        t_error("tdelete foobar should fail\n");
    }

    twalk(g_root, Act);
    if (g_wantc != 'j') {
        t_error("twalk did not visit all nodes (wanted 'j' got '%c')\n", g_wantc);
    }
    g_searchkey = "h";
    twalk(g_root, GetParent);
    if (g_parent == nullptr) {
        t_error("twalk search for key \"%s\" failed\n", g_searchkey);
    }
    p = DelFunc("h");
    if (p != g_parent) {
        t_error("tdelete h failed to return parent (got %p wanted %p)\n", p, g_parent);
    }

    e = *(struct e**)g_root;
    if (!DelFunc(e->k)) {
        t_error("tdelete root \"%s\" failed (returned 0)\n", e->k);
    }

    for (; g_count; g_count--) {
        e = *(struct e**)g_root;
        if (!tdelete(e, &g_root, Cmp)) {
            t_error("tdelete k=%s failed during destruction\n", e->k);
        }
    }
    if (g_root) {
        t_error("tree destruction failed: root is nonzero %p\n", g_root);
    }

    return g_tStatus;
}

int SearchTsearchTest(void)
{
    return SearchTsearchTestImpl();
}
