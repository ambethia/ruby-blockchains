# Creating a Blockchain in Ruby

![](https://na2.api.pressly.com/hubs/6686/files/public/147117/download/img.gif)

---

## What is a Blockchain?

^ A Blockchain is a database of records, called blocks, which are linked together cryptographically.

---

## What is a Blockchain used for?

> An open, distributed ledger that can record transactions between two parties efficiently and in a verifiable and permanent way.[^†]

[^†]: https://hbr.org/2017/01/the-truth-about-blockchain

---

## Bitcoin

![](https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/08/14/16/bitcoin-price-crash-cryptocurrency-suicide.jpg)

^ The first thing that comes to mind in reference to Blockchains is cryptocurrency, like Bitcoin.

---

## This is not Satoshi Nakamoto.

^ Created in 2008, by Satoshi Nakamoto, an anonymous inventor, who has since disappeared from the community. Not unlike Why? the Lucky Stiff.
^ Bitcoin is the first cryptocurrency to gain any widespread use, and was the first to solve the "double-spending problem"
^ "Bitcoin: A peer-to-peer electronic cash system"

![right](https://hackadaycom.files.wordpress.com/2016/05/73629441_73629436.jpg?w=624)

---

## Double Spending

^ Like writing a bad check.
^ If I pay Peter with a check, what is stopping me from trying to write a check to pay Paul with the same funds?

---

![fit](http://adilmoujahid.com/images/blockchain-cash-bitcoin.png)

^ Cash doesn't have this problem.
^ With debit and credit card, we use a centralized source of truth, Banks.
^ In 2008, with the collapse of economy, and the breach in trust of our banking system, the need arose for a decentralized, trust-less way of transacting online.

---

## How do blockchains solve this problem?

^ This presentation isn't about bitcoin though, it's about the blockchains, the invention at the heart of BTC and other crypto currencies.

---

![fit](https://cdn-images-1.medium.com/max/1600/1*xgpVRSJA707FH3m_x4nHWw.png)

^ As new blocks (containing transactions) are broadcast to the network by peers, validity blocks are confirmed cryptographically by miners, and appended to the blockchain.
^ Any attempt to double spend money would create a separate fork in the chain, as both transactions could not be valid in the same chain.
^ The longest chain wins. One vulnerability here is something called a 51% attack, where if a malicious entity controlled more than half of the nodes in the network, they could force the network to accept the "double spent" transaction by verifying blocks on that chain, rather than the legitimate chain.

---

## Consensus

^ TX fees motivate miners to include your valid TX in their blocks.
^ BTC uses a consensus model called "Proof of Work", basically to ensure that nodes producing verification of block validity have skin in the game.
^ Other consensus methods exist, but each have their own drawbacks.
^ This is a deep topic we won't cover much further, or implement in code.

---

## What is a Block?

^ Some data (typically transactions), combined with the hash of the previous block, are taken together to produce a block of transactions with their own unique cryptographic hash that feeds into the next block.

---

![fit](https://cdn-images-1.medium.com/max/1600/1*_RY4v9D5-BOVMzFMr8Dk4A.png)

---

### That sounds like git.

## Is _git_ a blockchain?

---

### _Sort of_.

^ It really depends on how strictly you define a blockchain.
^ The main difference is, git leaves the consensus mechanisms to the users

---

### What do transactions look like?

^ Lot of ways of modeling transactions, we're going to talk about the way BTC does it, with UTXO

---

![fit](https://cdn-images-1.medium.com/max/1600/1*eAKr5SIZfWXwC9dFBOmS3Q.png)

---

Ok, let's code!

---
