# voice-grade-classification

对用于语音进行评分， 首先提取关键特征， 然后进行分类训练。 

特征提取：
  * 有效单词总数量 
  * 语速， 每分钟有效单词量
  * 语法错误个数
  * 发音流畅度（通过mfcc 提取声音向量进行分类）
  * 覆盖名词的比率 ，包括近义词， 回答的语音中包含的名词和范文中的名词进行比较， 得出百分比。
  * 覆盖动词的比率， 和上面名词类似
   
  
###  有效单词数量

 通过AWS Transcript 将语音转成文本， 然后计算单词个数， 和不重复的单词个数。 
 

###  语速
  通过单词个数和发音时长， 计算语速
  
### 发音流畅度
  通过MFCC 进行声音特征提取， 然后进行分类。 
  
### 语法错误个数

参考开源解决方案

[https://github.com/myint/language-check](https://github.com/myint/language-check) 

[https://github.com/shikanon/AutoPerusalProcedure](https://github.com/shikanon/AutoPerusalProcedure)

[https://languagetool.org/dev](https://languagetool.org/dev)


### 名词 动词语义覆盖度

通过AWS comprehend 对单词进行分类， 然后进行名词和动词的统计， 并且和范文进行比对。 

同时需要 word2vec词向量，统计近义词。 



### 操作步骤参考 feature-extract.ipynb

