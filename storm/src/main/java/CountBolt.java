

import org.apache.storm.task.OutputCollector;
import org.apache.storm.task.TopologyContext;
import org.apache.storm.topology.OutputFieldsDeclarer;
import org.apache.storm.topology.base.BaseRichBolt;
import org.apache.storm.tuple.Fields;
import org.apache.storm.tuple.Tuple;
import org.apache.storm.tuple.Values;

import java.util.HashMap;
import java.util.Map;

public class CountBolt extends BaseRichBolt {

    // 发射器
    private OutputCollector collector;
    // 为了计数
    private Map<String, Integer> counts;

    public void prepare(Map arg0, TopologyContext arg1, OutputCollector arg2) {
        this.collector = arg2;
        this.counts = new HashMap<String, Integer>();
    }

    /**
     * 声明key名称，可以同时声明多个
     */
    public void declareOutputFields(OutputFieldsDeclarer arg0) {
        arg0.declare(new Fields("word", "count"));
    }

    /**
     * 统计单词
     */
    public void execute(Tuple input) {
        String word = input.getStringByField("word");

        int count = 1;
        // 如果这个单词已经存在，则取出count再加一
        if (counts.containsKey(word)) {
            count = counts.get(word) + 1;
        }
        counts.put(word, count);
        this.collector.emit(new Values(word, count));
    }
}
