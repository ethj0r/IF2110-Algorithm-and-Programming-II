#ifndef __MESIN_KAR__
#define __MESIN_KAR__

#include "boolean.h"

#define MARK '.'

extern char cc;
extern boolean eop;

void start();
/* Mesin siap dioperasikan. Pita disiapkan untuk dibaca.
Karakter pertama yang ada pada pita posisinya adalah pada jendela.
I.S.: sembarang
F.S.: cc adalah karakter pertama pada pita
        Jika cc != MARK maka eop akan padam (false)
        Jika cc = MARK maka eop akan menyala (true) */

void adv();
/* Pita dimajukan satu karakter.
I.S.: Karakter pada jendela = cc, cc != MARK
F.S.: cc adalah karakter berikutnya dari cc yang lama,
        cc mungkin = MARK
        Jika cc = MARK maka eop akan menyala (true) */

#endif