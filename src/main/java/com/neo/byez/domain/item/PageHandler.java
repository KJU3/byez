package com.neo.byez.domain.item;

public class PageHandler {

    private int totalCnt;
    private int pageSize;
    private int naviSize = 10;
    private int totalPage;
    private int page;
    private int beginPage;
    private int endPage;
    private boolean showPrev;
    private boolean showNext;

    public PageHandler(int totalCnt, int page) {

        this(totalCnt, page, 10);
    }

    public PageHandler(int totalCnt, int page, int pageSize) {
        this.totalCnt = totalCnt;
        this.page = page;
        this.pageSize = pageSize;

        // 계산
        this.totalPage = (int) Math.ceil(totalCnt / pageSize);
        this.beginPage = (page-1)/ naviSize * naviSize + 1;
        this.endPage = Math.min(beginPage+(naviSize-1), totalPage);
        this.showPrev = beginPage != 1;
        this.showNext = page != totalPage;

    }

    public void print() {
        // [PREV] 1 2 3 4 5 6 ... 10 [NEXT]
        // 이전 버튼
        System.out.print(showPrev ? "[PREV] " : "");

        // navi 숫자
        for (int i=beginPage; i<=endPage; i++) {
            System.out.print(i + " ");
        }

        // 다음 버튼
        System.out.print(showNext ? "[NEXT]" : "");
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public int getPageSize() {
        return pageSize;
    }

    public int getNaviSize() {
        return naviSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public int getPage() {
        return page;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }
}
