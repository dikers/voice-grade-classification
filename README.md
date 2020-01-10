# voice-grade-classification

根据用户语音回答的问题， 进行自动评分，首先提取关键特征， 然后进行机器学习分类训练。 

特征提取维度：
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

维基百科词向量项目地址   [https://nlp.stanford.edu/projects/glove/](https://nlp.stanford.edu/projects/glove/)

[预训练词向量下载](http://nlp.stanford.edu/data/glove.6B.zip) 包含维基百科40万单词

因为单词量比较多， 实时计算速度会慢， 可以将初高中常用的词汇近义词预先直接计算出来，放入数据库或者缓存中。

film 同义词
```
[('movie', 0.931), ('films', 0.924), ('documentary', 0.872), ('drama', 0.866), ('comedy', 0.866), ('directed', 0.843), ('movies', 0.843), ('acclaimed', 0.837), ('adaptation', 0.815), ('comic', 0.806)]
```
predict 同义词
```
[('predicting', 0.895), ('anticipate', 0.842), ('predicted', 0.837), ('foresee', 0.808), ('expect', 0.798), ('predictions', 0.788), ('suggest', 0.775), ('economists', 0.775), ('speculate', 0.759), ('likely', 0.753)]

```


### 操作步骤参考 [feature-extract.ipynb](./feature-extract.ipynb)

