require 'digest/sha1'

class RubyCoin
  GENESIS = "Tampa.rb Rocks"

  class BlockChain
    attr :genesis_block
    attr :latest_block

    def initialize
      genesis_data = RubyCoin::Datum.new(GENESIS)
      @genesis_block = RubyCoin::Block.new(genesis_data)
      @latest_block = @genesis_block
    end

    def append_block(hashable)
      block = RubyCoin::Block.new(hashable, @latest_block)
      @latest_block.next_block = block
      @latest_block = block
    end
  end

  class Block
    attr :data
    attr :previous_block
    attr_accessor :next_block

    def initialize(hashable, previous_block = nil)
      @previous_block = previous_block
      @data = hashable
    end

    def crypto_hash
      Digest::SHA1.hexdigest([
        @previous_block&.crypto_hash,
        @data.crypto_hash
      ].join)
    end
  end

  class Datum
    attr_accessor :content

    def initialize(content = '')
      @content = content
    end

    def crypto_hash
      Digest::SHA1.hexdigest(@content)
    end
  end
end
