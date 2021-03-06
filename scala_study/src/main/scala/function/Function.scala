package function

/**
  * Created by soap on 2018/3/29.
  */
object Function {

  def main(args: Array[String]): Unit = {
    /** function
      * 1.形式参数必须有类型
      * 2.返回值类型可以不指定 则最后一行为返回值
      * 3.没有等于号的则为特殊函数（结构体） 只能返回 Unit ()
      * 4.若指定返回值类型，则需要返回对应类型或者最后以对应类型结束 Unit 则为()
      * 5.方法内部不能给参数重新赋值
      * 6.带默认值参数，使用时参数可以不传，参数不足时，从前向后匹配
      */
    def f1(a: Int, b: String): Unit = {
      1 + a
      b
    }

    def f2(a: Int, b: String) = {
      if (a > 10) {
        1 + a
      } else {
        b
      }
    }

    def f3(a: Int, b: String) {
      return 1 + a
    }

    println(f1(10, "ss"))
    println(f2(10, "ss"))
    println(f3(10, "ss"))

    println("-------------------------------")

    val v1 = 10

    def f11 = (a: Int, b: Char) => {
      a
    }

    val f12 = (a: Int, b: Char) => {
      b
    }

    println(v1)
    println(f11(1, 's'))
    println(f12(1, 's'))

    println("-----------------默认参数-----------------")

    /**
      * //默认值参数
      * 1.默认参数可以不传
      * 2.可是指定参数名称传值
      */
    def f4(a: Int, b: String, c: Int = 1) {
      //      a = c
      println(a + b + c)
    }

    f4(b = "b", a = 1, c = 4)

    /**
      * 可变参数
      * 1.可变参数只能有一个，且必须为最后一个参数
      * 2.调用时实例化，根据参数个数实例化<function0><function1>
      */
    def f5(a: Int*): Unit = {
      a.foreach(println(_))
    }

    f5(1, 2, 3, 4, 5)

    //不能直接实例化可变参数函数，函数类型未知
    //    val f51 = (a:Int*)=>{}
    //    print(f51)

    /**
      * 懒加载
      */

    println("=============懒加载==================")

    def f61(a: Int) = {
      println(a)
      a + 1
    }

    def f62(): Unit = {
      lazy val tmp = f61(1)
      println("111")
      println(tmp)
      println("222")
    }

    /* 去除懒加载
    1
    111
    2
    222
     懒加载
    111
    1
    2
    222
    */
    f62()

    println("===========递归函数==========")

    /**
      * 尾递归 循环调用在最后（可优化）；非尾递归
      *  1.递归函数必须指定返回值
      *
      */
    def f7(n: Int): Int = {
      if (n <= 1) {
        1
      } else {
        n * f7(n - 1)
      }
    }

    println(f7(3))

   
    def decorate(str: String, left: String = "[", right: String = "]") = {
      left + str + right
    }

    println(decorate("a", right = ","))


  }

}
