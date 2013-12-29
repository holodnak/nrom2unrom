;;nintendo nrom to unrom loader - James Holodnak 2013

.MEMORYMAP
  SLOTSIZE $2000
  DEFAULTSLOT 0
  SLOT 0 $8000
.ENDME

.ROMBANKMAP
  BANKSTOTAL 1
  BANKSIZE $2000
  BANKS 1
.ENDRO

;;ppu registers
.define PPUCTRL     $2000
.define PPUMASK     $2001
.define PPUSTATUS   $2002
.define OAMADDR     $2003
.define OAMDATA     $2004
.define PPUSCROLL   $2005
.define PPUADDR     $2006
.define PPUDATA     $2007

.BANK 0 SLOT 0
.ORG $0000

;;reset vector
reset:
  cld
  sei
  lda #$00
  sta $2000
  sta $FF
  sta $2001
  sta $FE
- lda $2002
  bpl -
- lda $2002
  bpl -
  ldx #$3F
  txs

  ;;reset ppu toggle
  ldy PPUSTATUS

  ;;set ppu vram address to 0
  lda #0
  sta PPUADDR
  sta PPUADDR

  ;;copy all chrrom
  lda #$A0
  sta $01
  lda #$00
  sta $00
  sta PPUADDR  ;; load the destination address into the PPU
  sta PPUADDR
  ldy #0
  ldx #32
- lda ($00),y  ;; copy one byte
  sta PPUDATA
  iny
  bne -
  inc $01
  dex
  bne -

  ;;begin real rom
  jmp ($9000)
