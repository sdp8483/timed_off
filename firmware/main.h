#ifndef _MAIN_H_
#define _MAIN_H_

#define BIT0    (1<<0)
#define BIT1    (1<<1)
#define BIT2    (1<<2)
#define BIT3    (1<<3)
#define BIT4    (1<<4)
#define BIT5    (1<<5)
#define BIT6    (1<<6)
#define BIT7    (1<<7)

#define SET(PORT, PIN)      (PORT |= (1 << PIN))
#define RESET(PORT, PIN)    (PORT &= ~(1 << PIN))
#define TOGGLE(PORT, PIN)   (PORT ^= (1 << PIN))

#endif /* _MAIN_H_ */