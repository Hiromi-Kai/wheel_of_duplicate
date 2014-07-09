# coding:utf-8
#配列から順列を作り出し、処理を実施
#普通はArray.permutationを使えばいいはず
module Permutation extend self
  public
  def exec(array,data=[],length=array.length)
    exec_lambda(array,->(f){p f},data,length)
  end
  def exec_lambda(array,process=->(data){p data},data=[],length=array.length)
    array.each_with_index do |f,i|
      data<<f
      exec_lambda(array.reject.with_index{|g,j|i==j and f==g},process,data,length)
      #順列のデータ配列が完成
      if data.length==length
        process.call(data)
      end
      data.pop
    end
  end
end


if $0 == __FILE__
  # Permutation.exec([1,2,3])
  # Permutation.exec([1,2,2])
  Permutation.exec([1,2,3,3])
  Permutation.exec_lambda([1,2,3],->(data){p data.inject(:+)})
  #Permutation.exec([1,2,3,4])
end
