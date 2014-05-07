# coding: utf-8
class Hash
  def hashmap(&block)
    result = map(&block)
    Hash[*result.flatten]
  end
end
