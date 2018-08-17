require "minitest/autorun"
require "ruby_coin"

class RubyCoinTest < Minitest::Test
  def setup
    genesis_data = RubyCoin::Datum.new(RubyCoin::GENESIS)
    @genesis_block = RubyCoin::Block.new(genesis_data)
  end

  def test_block_can_be_hashed
    assert @genesis_block.crypto_hash
  end

  def test_blocks_can_be_chained
    data = RubyCoin::Datum.new('Hello, World')
    new_block = RubyCoin::Block.new(data, @genesis_block)
    assert_equal new_block.previous_block.crypto_hash, @genesis_block.crypto_hash
    refute_equal new_block.crypto_hash, @genesis_block.crypto_hash
  end

  def test_blockchain_has_a_genesis_block
    chain = RubyCoin::BlockChain.new
    assert_equal @genesis_block.crypto_hash, chain.genesis_block.crypto_hash
  end

  def test_blockchain_can_create_a_new_block
    chain = RubyCoin::BlockChain.new
    block = chain.append_block(RubyCoin::Datum.new("Blocks rock too!"))
    assert_equal RubyCoin::Block, block.class
    assert_equal block, chain.latest_block
  end

  def test_blockchain_can_chain_blocks
    chain = RubyCoin::BlockChain.new
    block = chain.append_block(RubyCoin::Datum.new("Blocks rock too!"))
    assert_equal block, chain.latest_block
    assert_equal chain.genesis_block, chain.latest_block.previous_block
  end

  def test_blockchain_blocks_have_a_next_block
    chain = RubyCoin::BlockChain.new
    block = chain.append_block(RubyCoin::Datum.new("Blocks still rock!"))
    assert_equal chain.genesis_block.next_block, block
  end

  def test_validity_of_chain_hashes
    chain = RubyCoin::BlockChain.new
    chain.append_block(RubyCoin::Datum.new("One Fish"))
    chain.append_block(RubyCoin::Datum.new("Two Fish"))
    chain.append_block(RubyCoin::Datum.new("Red Fish"))
    chain.append_block(RubyCoin::Datum.new("Block Fish"))
    good_hash = chain.latest_block.crypto_hash
    chain.genesis_block.data.content = "h@x0r3d"
    bad_hash =  chain.latest_block.crypto_hash
    refute_equal good_hash, bad_hash
  end
end
