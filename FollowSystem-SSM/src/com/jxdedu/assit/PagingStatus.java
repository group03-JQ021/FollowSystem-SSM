package com.jxdedu.assit;

import org.apache.log4j.Logger;

/**
 * 存储与当前分页相关的信息.
 * 目前有七个属性; 分别是,
 *  当前页号 currentPage
 *  页面容量 pageSize
 *  总页数    pageCount
 *  总记录数 totalCount
 *  翻页栏最大长度 maxNavLength
 *  翻页栏起点(包括) navBegin
 *  翻页栏终点(不包括) navEnd
 *  
 *  其中, currentPage, pageSize, totalCount, maxNavLength 是必须由调用者手动设置的,这四个参数可读,可写;
 *  其余参数会自动计算, 只可读,不可写;
 *  自动计算的参数的计算规则:
 *      pageCount(略)
 *      翻页栏起止点: 以当前页为中心,向左右两侧延伸,直到达到maxNavLength,或 pageCount;
 *      当要显示的分页页号数为奇数时,则使当前页处于正中央; 如: 1, 2,3(当前页),4,5
 *      为偶数时,当前页号属于前一半,如 1,2,3(当前页),4,5,6
 * @ClassName PagingConfig
 * @author 陈希展 
 * @date 2018年6月21日
 */
public class PagingStatus{
    /*
     * 默认参数
     */
    private int currentPage = 1;
    private int pageSize = 5;
    private int totalCount = 1;
    private int maxNavLength = 10;
    
    private int pageCount;
    private int navBegin;
    private int navEnd;
    
    private boolean flag = false;   // 字段状态是否一致, 如果不一致,在获取字段时,会先行计算,至一致状态.
    
    Logger logger  = Logger.getLogger(PagingStatus.class.getName());
    
    /**
     * 默认,当前页号为 1, 分页大小为 5; 分页导航栏最大长度为 10; 
     * @param totalCount
     */
    public PagingStatus(int totalCount){
        logger.debug("初始化:"+totalCount);
        setTotalCount(totalCount);
        validation();
        logger.debug("初始化完成:"+this);
    }
    
    public int getTotalCount() { return totalCount;}
    public int getPageSize() { return pageSize;}
    public int getCurrentPage() { return currentPage;}
    public int getmaxNavLength() { return maxNavLength;}
    /**
     * 设置当前页号
     * @param currentPage
     */
    public void setCurrentPage(int currentPage) {
        if (pageSize < 1){
            throw new IllegalArgumentException("");
        }
        this.currentPage = currentPage;
        this.flag = false;
    }
    /**
     * 设置页面大小
     * @param pageSize
     */
    public void setPageSize(int pageSize) { 
        if (pageSize < 1){
            throw new IllegalArgumentException("分页大小不得小于1.");
        }
        this.pageSize = pageSize;
        this.flag = false;
    }
    /**
     * 设置记录总数.
     * 本类将根据记录总数和页面大小计算分页总数.
     * 计算发生于: 自上次修改后,第一次获取分页总数(等需要计算的参数)
     * @param totalCount
     */
    public void setTotalCount(int totalCount) { 
        if (totalCount < 0){
            throw new IllegalArgumentException("记录总数不可为负数");
        }
        this.totalCount = totalCount;
        this.flag = false;
    }
    /**
     * 设置分页导航栏一次性最多列出的页面总数.
     * @param maxNavLength
     */
    public void setmaxNavLength(int maxNavLength) { 
        this.maxNavLength = maxNavLength;
        this.flag = false;
    }
    
    /**
     * 计算参数
     */
    private void validation(){
        if (flag) return;
        // pageCount
        pageCount = totalCount/pageSize;
        if (totalCount % pageSize != 0){ pageCount++;}
        
        
        // navBegin/End
        // 总页数不超过最大分页显示数, 当列出所有分页页号
        if (pageCount <= maxNavLength){
            navBegin = 1;
            navEnd = pageCount+1;
        }else{  // 否则,只有部分分页号可以列出
            // 分页页号区间长度必定为 maxNavLength
            
            // 先, 以 currentPage 为中心,拉出一个长度为 maxNavLength 的区间 [navBegin, navEnd)
            int tmp = maxNavLength/2;
            navBegin = currentPage - tmp - 1; // 多减去1,是为了保证,当区间长度为偶数时,当前页面位于前半个区间;
            navEnd  = navBegin + maxNavLength;
            // 再, 保证区间应该满足 1<= navBegin <= navEnd <= pageCount+1
            // 如果区间超出这个范围,就必须向里滑动该区间
            if (navEnd > pageCount + 1){
                navBegin -= (navEnd - (pageCount - 1));
                navEnd = pageCount + 1;
            }else if (navBegin < 1){
                navEnd += (1-navBegin);
                navBegin = 1;
            }
        }
        
        flag = true;
        logger.debug("参数计算完成:"+this);
    }
    
    public int getPageCount() {
        validation();
        return pageCount;
    }
    public int getNavBegin() {
        validation();
        return navBegin;
    }
    public int getNavEnd() {
        validation();
        return navEnd;
    }
    

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "分页数据:[当前页号:" + currentPage + ", 分页大小:" + pageSize + ", 分页总数:" + pageCount
                + ", 记录总数:" + totalCount + ", 分页导航项数:" + maxNavLength + ", 分页导航开始项:" + navBegin
                + ", 分页导航末项:" + navEnd + "]";
    }
    
}
