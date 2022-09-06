S e t W o r k i n g D i r   A _ S c r i p t D i r  
 # I n c l u d e   " F u n c t i o n s . a h k "   ; i n c l u d e s   f u n c t i o n   d e f i n i t i o n s   s o   t h e y   d o n ' t   c l o g   u p   t h i s   s c r i p t .   M S _ F u n c t i o n s   m u s t   b e   i n   t h e   s a m e   d i r e c t o r y   a s   t h i s   s c r i p t  
 S e t D e f a u l t M o u s e S p e e d   0   ; s e t s   d e f a u l t   M o u s e M o v e   s p e e d   t o   0   ( i n s t a n t )  
 S e t W i n D e l a y   0   ; s e t s   d e f a u l t   W i n M o v e   s p e e d   t o   0   ( i n s t a n t )  
 T r a y S e t I c o n ( A _ W o r k i n g D i r   " \ S u p p o r t   F i l e s \ I c o n s \ k e y b o a r d . i c o " )  
 ; S e t C a p s L o c k S t a t e   " A l w a y s O f f "   ; h a v i n g   t h i s   o n   b r o k e   m y   m a i n   s c r i p t   f o r   w h a t e v e r   r e a s o n  
 S e t N u m L o c k S t a t e   " A l w a y s O n "  
 # S i n g l e I n s t a n c e   F o r c e   ; o n l y   o n e   i n s t a n c e   o f   t h i s   s c r i p t   m a y   r u n   a t   a   t i m e !  
 ; A _ M e n u M a s k K e y   : =   " v k 0 7 "   ; h t t p s : / / a u t o h o t k e y . c o m / b o a r d s / v i e w t o p i c . p h p ? f = 7 6 & t = 5 7 6 8 3  
 # W i n A c t i v a t e F o r c e   ; h t t p s : / / a u t o h o t k e y . c o m / d o c s / c o m m a n d s / _ W i n A c t i v a t e F o r c e . h t m   ; p r e v e n t   t a s k b a r   f l a s h i n g .  
  
 ; \ \ C U R R E N T   S C R I P T   V E R S I O N \ \ T h i s   i s   a   " s c r i p t "   l o c a l   v e r s i o n   a n d   d o e s n ' t   r e l a t e   t o   t h e   R e l e a s e   V e r s i o n  
 ; \ \ v 2 . 8 . 5  
  
 ; \ \ C U R R E N T   R E L E A S E   V E R S I O N  
 ; \ \ v 2 . 5 . 2  
  
 ;   \ \ \ \ \ \ \ \ / / / / / / / / / / / /  
 ;   T H I S   S C R I P T   W A S   O R I G I N A L L Y   C R E A T E D   B Y   T A R A N   F R O M   L T T ,   I   H A V E   S I M P L Y   A D J U S T E D   I T   T O   W O R K   I N   A H K   v 2 . 0  
 ;   A L S O   I   A M   C U R R E N T L Y   U S I N G   A   P L A N C K   E Z   C U S T O M   K E Y B O A R D   W I T H   C U S T O M   Q M K   F I R M W A R E   A N D   N O T   U S I N G   T H E   H A S U   U S B   - >   U S B   C O N V E R T E R .   C h e c k   R e l e a s e   v 2 . 2 . 5 . 1   a n d   b e l o w   f o r   a   v e r s i o n   o f   t h i s   s c r i p t   w r i t t e n   f o r   a   s m a l l   s e c o n d a r y   n u m p a d  
 ;   A N Y   O F   T H E   S C R I P T S   I N   T H I S   F I L E   C A N   B E   P U L L E D   O U T   A N D   T H E N   R E P L A C E D   O N   A   N O R M A L   K E Y   O N   Y O U R   N O R M A L   K E Y B O A R D  
 ;   T h i s   s c r i p t   l o o k e d   v e r y   d i f f e r e n t   w h e n   i n i t i a l l y   c o m m i t t e d .   I t s   m e s s i n e s s   w a s   t o o   m u c h   o f   a   p a i n   f o r   m e   s o   I ' v e   s t r i p p e d   a   b u n c h   o f  
 ;   u n n e c e s s a r y   c o m m e n t s  
 ;   \ \ \ \ \ \ \ \ / / / / / / / / / / /  
  
 ; c h e c k s   t o   m a k e   s u r e   t h e   u s e r   i s   u s i n g   a   c o m p a t i b l e   v e r s i o n   o f   a h k  
 v e r C h e c k ( )  
  
 / *  
   T h i s   f u n c t i o n   c r e a t e s   a   t o o l t i p   t o   i n f o r m   t h e   u s e r   o f   t h e   p r e s s e d   k e y   a n d   t h a t   i t   h a s n ' t   b e e n   a s s i g n e d   t o   d o   a n y t h i n g   y e t  
   * /  
 u n a s s i g n e d ( )   ; c r e a t e   a   t o o l t i p   f o r   u n u s e d   k e y s  
 {  
 	 T o o l T i p ( A _ T h i s H o t k e y   "   i s   u n a s s i g n e d " )  
 	 S e t T i m e r ( t i m e o u t t i m e ,   - 1 0 0 0 )  
 	 t i m e o u t t i m e ( )  
 	 {  
 	 	 T o o l T i p ( " " )  
 	 }  
 }  
  
 / *  
   T h i s   f u n c t i o n   i s   s p e c i f i c a l l y   d e s i g n e d   f o r   t h i s   s c r i p t   a s   I   h a v e   a   b u t t o n   d e s i g n e d   t o   b e   p r e s s e d   a l o n g s i d e   a n o t h e r   j u s t   t o   o p e n   n e w   w i n d o w s  
   @ p a r a m   k e y   i s   t h e   a c t i v a t i o n   k e y   o f   t h e   p r o g r a m   ( n o t   t h e   k e y   t o   r u n   a n   a d d i t i o n a l   w i n d o w ) .   T h e s e   a r e   N O T   l i s t e d   i n   K S A   s i m p l y   b e c a u s e   t h i s   s c r i p t   i s   s o   i n c r e d i b l y   s p e c i f i c   t o   m y   w o r k f l o w  
   @ p a r a m   c l a s s o r e x e   i s   j u s t   d e f i n i n g   i f   w e ' r e   t r y i n g   t o   g r a b   t h e   c l a s s   o r   e x e  
   @ p a r a m   a c t i v a t e   i s   w h a t e v e r   u s u a l l y   c o m e s   a f t e r   t h e   a h k _ c l a s s   o r   a h k _ e x e   t h a t   a h k   i s   g o i n g   t o   u s e   t o   a c t i v a t e   o n c e   i t ' s   o p e n  
   @ p a r a m   r u n v a l   i s   w h a t e v e r   y o u   n e e d   t o   p u t   i n t o   a h k   t o   r u n   a   n e w   i n s t a n c e   o f   t h e   d e s i r e d   p r o g r a m   ( e g .   a   f i l e   p a t h )  
   * /  
 n e w W i n ( c l a s s o r e x e ,   a c t i v a t e ,   r u n v a l )  
 {  
 	 g e t H o t k e y s ( & f i r s t ,   & s e c o n d )  
 	 K e y W a i t ( s e c o n d )   ; p r e v e n t   s p a m m i n g  
 	 i f   n o t   W i n E x i s t ( " a h k _ "   c l a s s o r e x e   .   a c t i v a t e )  
 	 	 {  
 	 	 	 R u n ( r u n v a l )  
 	 	 	 W i n W a i t ( " a h k _ "   c l a s s o r e x e   .   a c t i v a t e )  
 	 	 	 W i n A c t i v a t e ( " a h k _ "   c l a s s o r e x e   .   a c t i v a t e )   ; i n   w i n 1 1   r u n n i n g   t h i n g s   w o n ' t   a l w a y s   a c t i v a t e   i t   a n d   w i l l   o p e n   i n   t h e   b a c k r o u n d  
 	 	 }  
 	 e l s e  
 	 	 R u n ( r u n v a l )  
 }  
  
 / *   n u m p a d 0 0 0 ( )  
   A   f u n c t i o n   t o   s u p p r e s s   m u l t i p l e   k e y s t r o k e s   o r   t o   d o   d i f f e r e n t   t h i n g s   w i t h   m u l t i p l e   p r e s s e s   o f   t h e   s a m e   k e y .   T h i s   f u n c t i o n   i s   h e r e   f o r   r e f e r e n c e   m o r e s o   t h a n   a c t u a l   u s e  
   * /  
 n u m p a d 0 0 0 ( )  
 {  
 	 	 s t a t i c   w i n c _ p r e s s e s   : =   0  
 	 	 i f   w i n c _ p r e s s e s   >   0   ;   S e t T i m e r   a l r e a d y   s t a r t e d ,   s o   w e   l o g   t h e   k e y p r e s s   i n s t e a d .  
 	 	 {  
 	 	 	 w i n c _ p r e s s e s   + =   1  
 	 	 	 r e t u r n  
 	 	 }  
 	 	 ;   O t h e r w i s e ,   t h i s   i s   t h e   f i r s t   p r e s s   o f   a   n e w   s e r i e s .   S e t   c o u n t   t o   1   a n d   s t a r t  
 	 	 ;   t h e   t i m e r :  
 	 	 w i n c _ p r e s s e s   : =   1  
 	 	 S e t T i m e r   A f t e r 4 0 0 ,   - 5 0   ;   W a i t   f o r   m o r e   p r e s s e s   w i t h i n   a   4 0 0   m i l l i s e c o n d   w i n d o w .  
  
 	 	 A f t e r 4 0 0 ( )     ;   T h i s   i s   a   n e s t e d   f u n c t i o n .  
 	 	 {  
 	 	 	 i f   w i n c _ p r e s s e s   =   1   ;   T h e   k e y   w a s   p r e s s e d   o n c e .  
 	 	 	 {  
 	 	 	 	 s l e e p   1 0     ;   O p e n   a   f o l d e r .  
 	 	 	 }  
 	 	 	 e l s e   i f   w i n c _ p r e s s e s   =   2   ;   T h e   k e y   w a s   p r e s s e d   t w i c e .  
 	 	 	 {  
 	 	 	 	 ;   P U T   C O D E   H E R E   L A T E R   ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` ` `  
 	 	 	 }  
 	 	 	 e l s e   i f   w i n c _ p r e s s e s   >   2  
 	 	 	 {  
 	 	 	 	 s l e e p   1 0  
 	 	 	 }  
 	 	 	 ;   R e g a r d l e s s   o f   w h i c h   a c t i o n   a b o v e   w a s   t r i g g e r e d ,   r e s e t   t h e   c o u n t   t o  
 	 	 	 ;   p r e p a r e   f o r   t h e   n e x t   s e r i e s   o f   p r e s s e s :  
 	 	 	 w i n c _ p r e s s e s   : =   0  
 	 	 }  
 }  
  
 / *  
 d e l e ( )   ; t h i s   i s   h e r e   s o   m a n I n p u t ( )   c a n   w o r k ,   y o u   c a n   j u s t   i g n o r e   t h i s  
 {  
 	 S e n d I n p u t ( " { B a c k S p a c e } " )  
 }  
  
 ; a d d e d   f u n c t i o n a l i t y   i n   m y   m a i n   s c r i p t   t o   r e l o a d   a l l   s c r i p t s  
 ! + r : :  
 {  
 	 R e l o a d  
 	 S l e e p   1 0 0 0   ;   I f   s u c c e s s f u l ,   t h e   r e l o a d   w i l l   c l o s e   t h i s   i n s t a n c e   d u r i n g   t h e   S l e e p ,   s o   t h e   l i n e   b e l o w   w i l l   n e v e r   b e   r e a c h e d .  
 	 ; M s g B o x   " T h e   s c r i p t   c o u l d   n o t   b e   r e l o a d e d .   W o u l d   y o u   l i k e   t o   o p e n   i t   f o r   e d i t i n g ? " , ,   4  
 	 R e s u l t   : =   M s g B o x ( " T h e   s c r i p t   c o u l d   n o t   b e   r e l o a d e d .   W o u l d   y o u   l i k e   t o   o p e n   i t   f o r   e d i t i n g ? " , ,   4 )  
 	 	 i f   R e s u l t   =   " Y e s "  
 	 	 	 {  
 	 	 	 	 i f   W i n E x i s t ( " a h k _ e x e   C o d e . e x e " )  
 	 	 	 	 	 	 W i n A c t i v a t e  
 	 	 	 	 e l s e  
 	 	 	 	 	 R u n   " C : \ U s e r s \ T o m \ A p p D a t a \ L o c a l \ P r o g r a m s \ M i c r o s o f t   V S   C o d e \ C o d e . e x e "  
 	 	 	 }  
 }  
 * /  
  
 ; ; W H A T ' S   T H I S   A L L   A B O U T ? ?  
  
 ; ; T H E   S H O R T   V E R S I O N :  
 ; ;   h t t p s : / / w w w . y o u t u b e . c o m / w a t c h ? v = k T X K 8 k Z a Z 8 c  
  
 ; ; T H E   L O N G   V E R S I O N :  
 ; ;   h t t p s : / / w w w . y o u t u b e . c o m / p l a y l i s t ? l i s t = P L H 1 g H 0 v 9 E 3 r u Y r N y R b H h D e 6 X D f w 4 s Z d Z r  
  
  
 ; ; + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ; ;  
 ; ; + + + + + + + + + + + + + + + + +   B E G I N   S E C O N D   K E Y B O A R D   F 2 4   A S S I G N M E N T S   + + + + + + + + + + + + + + + + + + + + + ; ;  
 ; ; + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + ; ;  
  
 ; ;   Y o u   s h o u l d   D E F I N I T E L Y   n o t   b e   t r y i n g   t o   a d d   a   2 n d   k e y b o a r d   u n l e s s   y o u ' r e   a l r e a d y  
 ; ;   f a m i l i a r   w i t h   h o w   A u t o H o t k e y   w o r k s .   I   r e c o m m e n d   t h a t   y o u   a t   l e a s t   t a k e   t h i s   t u t o r i a l :  
 ; ;   h t t p s : / / l e x i k o s . g i t h u b . i o / v 2 / d o c s / T u t o r i a l . h t m  
  
 ; ;   T h e   p o i n t   o f   t h e s e   i s   t h a t   T H E   T O O L T I P S   A R E   M E R E L Y   P L A C E H O L D E R S .   W h e n   y o u   a d d   a   f u n c t i o n   o f   y o u r   o w n ,   y o u   s h o u l d   d e l e t e   o r   c o m m e n t   o u t   t h e   t o o l t i p .  
  
 ; ; C O O L   B O N U S   B E C A U S E   Y O U ' R E   U S I N G   Q M K :  
 ; ; T h e   u p   a n d   d o w n   k e y s t r o k e s   a r e   r e g i s t e r e d   s e p e r a t e l y .  
 ; ; T h e r e f o r e ,   y o u r   m a c r o   c a n   d o   h a l f   o f   i t s   a c t i o n   o n   t h e   d o w n   s t r o k e ,  
 ; ; A n d   t h e   o t h e r   h a l f   o n   t h e   u p   s t r o k e .   ( u s i n g   " k e y w a i t , " )  
 ; ; T h i s   c a n   b e   v e r y   h a n d y   i n   s p e c i f i c   s i t u a t i o n s .  
 ; ; T h e   C o r s a i r   K 5 5   k e y b o a r d   f i r e s   t h e   u p   a n d   d o w n   k e y s t r o k e s   i n s t a n t l y .  
  
 ; N u m l o c k   i s   a n   A W F U L   k e y .   I   p r e f e r   t o   l e a v e   i t   p e r m a n e n t l y   o n .  
  
 ; D E F I N E   S E P A R A T E   P R O G R A M S   F I R S T ,   T H E N   A N Y T H I N G   Y O U   W A N T   W H E N   N O   P R O G R A M   I S   A C T I V E   - >  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   A d o b e   P r e m i e r e   P r o . e x e " )   a n d   g e t K e y S t a t e ( " F 2 4 " ,   " P " )  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; F 2 4 : : r e t u r n   ; t h i s   l i n e   i s   m a n d a t o r y   f o r   p r o p e r   f u n c t i o n a l i t y  
  
  
 B a c k S p a c e   &   S C 0 2 7 : : k e y f r a m e ( " p o s i t i o n " )  
 B a c k S p a c e   &   / : : k e y f r a m e ( " p o s i t i o n " )  
 B a c k S p a c e   &   l : : k e y f r a m e ( " s c a l e " )  
 B a c k S p a c e   &   t : : k e y f r a m e ( " l e v e l " )  
 B a c k S p a c e   &   u : : k e y f r a m e ( " r o t a t i o n " )  
 B a c k S p a c e   &   y : : k e y f r a m e ( " o p a c i t y " )  
 S C 0 2 8   &   S C 0 2 7 : : m a n I n p u t ( " p o s i t i o n " )   ; m a n u a l l y   i n p u t   a n   x   v a l u e  
 S C 0 2 8   &   / : : m a n I n p u t ( " p o s i t i o n " ,   " 6 0 " )   ; m a n u a l l y   i n p u t   a   y   v a l u e  
 S C 0 2 8   &   l : : m a n I n p u t ( " s c a l e " )   ; m a n u a l l y   i n p u t   a   s c a l e   v a l u e  
 S C 0 2 8   &   u : : m a n I n p u t ( " r o t a t i o n " )   ; m a n u a l l y   i n p u t   a   r o t a t i o n   v a l u e  
 S C 0 2 8   &   y : : m a n I n p u t ( " o p a c i t y " )   ; m a n u a l l y   i n p u t   a n   o p a c i t y   v a l u e  
 S C 0 2 8   &   t : : m a n I n p u t ( " l e v e l " )   ; m a n u a l l y   i n p u t   a   l e v e l   v a l u e  
 E n t e r : : r e s e t ( )  
 E n t e r   &   S C 0 2 7 : : k e y r e s e t ( " p o s i t i o n " )  
 E n t e r   &   / : : k e y r e s e t ( " p o s i t i o n " )  
 E n t e r   &   l : : k e y r e s e t ( " s c a l e " )  
 E n t e r   &   t : : k e y r e s e t ( " l e v e l " )  
 E n t e r   &   u : : k e y r e s e t ( " r o t a t i o n " )  
 E n t e r   &   y : : k e y r e s e t ( " o p a c i t y " )  
 R i g h t : : u n a s s i g n e d ( )  
  
 p : : p r e s e t ( " g a u s s i a n   b l u r   2 0 " )   ; h o v e r   o v e r   a   t r a c k   o n   t h e   t i m e l i n e ,   p r e s s   t h i s   h o t k e y ,   t h e n   w a t c h   a s   a h k   d r a g s   o n e   o f   t h e s e   p r e s e t s   o n t o   t h e   h o v e r e d   t r a c k  
 S C 0 2 7 : : v a l u e h o l d ( " p o s i t i o n " )   ; p r e s s   t h e n   h o l d   t h i s   h o t k e y   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   x   v a l u e .   L e t   g o   o f   t h i s   h o t k e y   t o   c o n f i r m ,   S i m p l y   T a p   t h i s   h o t k e y   t o   r e s e t   v a l u e s  
 / : : v a l u e h o l d ( " p o s i t i o n " ,   " 6 0 " )   ; p r e s s   t h e n   h o l d   t h i s   h o t k e y   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   y   v a l u e .   L e t   g o   o f   t h i s   h o t k e y   t o   c o n f i r m ,   S i m p l y   T a p   t h i s   h o t k e y   t o   r e s e t   v a l u e s  
  
  
 o : : p r e s e t ( " p a r a m e t r i c " )  
 l : : v a l u e h o l d ( " s c a l e " )   ; p r e s s   t h e n   h o l d   t h i s   h o t k e y   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   s c a l e .   L e t   g o   o f   t h i s   h o t k e y   t o   c o n f i r m ,   S i m p l y   T a p   t h i s   h o t k e y   t o   r e s e t   v a l u e s  
 ; U p : : u n a s s i g n e d ( )  
 . : : m o v e p r e v i e w ( )   ; p r e s s   t h e n   h o l d   t h i s   h o t k e y   a n d   d r a g   t o   m o v e   p o s i t i o n .   L e t   g o   o f   t h i s   h o t k e y   t o   c o n f i r m ,   S i m p l y   T a p   t h i s   h o t k e y   t o   r e s e t   v a l u e s  
 ; D o w n : : u n a s s i g n e d ( )  
  
 i : : p r e s e t ( " l o r e m i p s u m " )   ; ( i f   y o u   a l r e a d y   h a v e   a   t e x t   l a y e r   c l i c k   i t   f i r s t ,   t h e n   h o v e r   o v e r   i t ,   o t h e r w i s e   s i m p l y . . )   - >   p r e s s   t h i s   h o t k e y ,   t h e n   w a t c h   a s   a h k   c r e a t e s   a   n e w   t e x t   l a y e r   t h e n   d r a g s   y o u r   p r e s e t   o n t o   t h e   t e x t   l a y e r .   ; t h i s   h o t k e y   h a s   s p e c i f i c   c o d e   j u s t   f o r   i t   w i t h i n   t h e   f u n c t i o n .   T h i s   a c t i v a t i o n   h o t k e y   n e e d s   t o   b e   d e f i n e d   i n   K e y b o a r d   S h o r t c u t s . i n i   i n   t h e   [ H o t k e y s ]   s e c t i o n  
 k : : g a i n ( " - 2 " )   ; R E D U C E   G A I N   B Y   - 2 d b  
 , : : g a i n ( " 2 " )   ; I N C R E A S E   G A I N   B Y   2 d b   = =   s e t   g   t o   o p e n   g a i n   w i n d o w  
 ; L e f t : : u n a s s i g n e d ( )  
  
 u : : v a l u e h o l d ( " r o t a t i o n " )   ; p r e s s   t h e n   h o l d   t h i s   h o t k e y   a n d   d r a g   t o   i n c r e a s e / d e c r e a s e   r o t a t i o n .   L e t   g o   o f   t h i s   h o t k e y   t o   c o n f i r m ,   S i m p l y   T a p   t h i s   h o t k e y   t o   r e s e t   v a l u e s  
 j : : g a i n ( " - 6 " )   ; R E D U C E   G A I N   B Y   - 6 d b  
 m : : g a i n ( " 6 " )   ; I N C R E A S E   G A I N   B Y   6 d b  
 ; P g U p : : u n a s s i g n e d ( )  
  
 y : : v a l u e h o l d ( " o p a c i t y " )  
 ; h : : u n a s s i g n e d ( )  
 n : : z o o m ( )  
 ; S p a c e : : u n a s s i g n e d ( )  
  
 t : : v a l u e h o l d ( " l e v e l " )   ; p r e s s   t h e n   h o l d   t h i s   h o t k e y   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   l e v e l   v o l u m e .   L e t   g o   o f   t h i s   h o t k e y   t o   c o n f i r m ,   S i m p l y   T a p   t h i s   h o t k e y   t o   r e s e t   v a l u e s   ; t h i s   h o t k e y   h a s   s p e c i f i c   c o d e   j u s t   f o r   i t   w i t h i n   t h e   f u n c t i o n .   T h i s   a c t i v a t i o n   h o t k e y   n e e d s   t o   b e   d e f i n e d   i n   K e y b o a r d   S h o r t c u t s . i n i   i n   t h e   [ H o t k e y s ]   s e c t i o n  
 g : :   ; t h i s   h o t k e y   w i l l   f i l l   t h e   f r a m e   t o   f i t   t h e   w i n d o w  
 {  
 	 S e n d I n p u t ( t i m e l i n e W i n d o w )  
 	 ; S e n d I n p u t ( s e l e c t A t P l a y h e a d )  
 	 S e n d I n p u t ( s c a l e F r a m e S i z e )  
 }  
 b : : u n a s s i g n e d ( )  
  
 r : : p r e s e t ( " t i n t   1 0 0 " )  
 f : :   ; t h i s   m a c r o   i s   t o   o p e n   t h e   s p e e d   m e n u  
 {  
 	 S e n d I n p u t ( t i m e l i n e W i n d o w )  
 	 S e n d I n p u t ( t i m e l i n e W i n d o w )  
 	 t r y   {  
 	 	 l o o p   3   {  
 	 	 	 e f f C l a s s N N   : =   C o n t r o l G e t C l a s s N N ( C o n t r o l G e t F o c u s ( " A " ) )  
 	 	 	 i f   e f f C l a s s N N   ! =   " D r o v e r L o r d   -   W i n d o w   C l a s s 3 "  
 	 	 	 	 b r e a k  
 	 	 	 s l e e p   3 0  
 	 	 }  
 	 }   c a t c h   a s   e   {  
 	 	 t o o l C u s t ( " s o m e t h i n g   b r o k e " )  
 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " E n c o u n t e r e d   a n   e r r o r   a t t e m p t i n g   t o   g e t   t h e   C o n t r o l C l a s s N N " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 E x i t  
 	 }  
 	 S e n d I n p u t ( s e l e c t A t P l a y h e a d   s p e e d H o t k e y )  
 }  
 v : :   ; t h i s   h o t k e y   w i l l   a c t i v a t e   t h e   p r o g r a m   m o n i t o r ,   f i n d   t h e   m a r g i n   b u t t o n   ( a s s u m i n g   y o u   h a v e   i t   t h e r e )   a n d   a c t i v a t e / d e a c t i v a t e   i t  
 {  
 	 b l o c k O n ( )  
 	 M o u s e G e t P o s ( & o r i g X ,   & o r i g Y )  
 	 S e n d I n p u t ( t i m e l i n e W i n d o w )  
 	 S e n d I n p u t ( t i m e l i n e W i n d o w )  
 	 / *   S e n d I n p u t ( p r o g r a m M o n i t o r )  
 	 S e n d I n p u t ( p r o g r a m M o n i t o r )  
 	 s l e e p   2 5 0  
 	 t o o l s C l a s s N N   : =   C o n t r o l G e t C l a s s N N ( C o n t r o l G e t F o c u s ( " A " ) )  
 	 C o n t r o l G e t P o s ( & t o o l x ,   & t o o l y ,   & w i d t h ,   & h e i g h t ,   t o o l s C l a s s N N )  
 	 s l e e p   2 5 0  
 	 i f   I m a g e S e a r c h ( & x ,   & y ,   t o o l x ,   t o o l y ,   t o o l x   +   w i d t h ,   t o o l y   +   h e i g h t ,   " * 2   "   P r e m i e r e   " m a r g i n . p n g " )   | |   I m a g e S e a r c h ( & x ,   & y ,   t o o l x ,   t o o l y ,   t o o l x   +   w i d t h ,   t o o l y   +   h e i g h t ,   " * 2   "   P r e m i e r e   " m a r g i n 2 . p n g " )   ;   t h e   a b o v e   c o d e   i s   i f   y o u   w a n t   t o   u s e   C l a s s N N   v a l u e s   i n s t e a d   o f   j u s t   s e a r c h i n g   t h e   r i g h t   s i d e   o f   t h e   s c r e e n .   I   s t o p p e d   u s i n g   t h a t   b e c a u s e   e v e n   t h o u g h   i t ' s   m o r e   u n i v e r s a l ,   i t ' s   j u s t   t o o   s l o w   t o   b e   u s e f u l   * /  
 	 i f   I m a g e S e a r c h ( & x ,   & y ,   A _ S c r e e n W i d t h   /   2 ,   0 ,   A _ S c r e e n W i d t h ,   A _ S c r e e n H e i g h t ,   " * 2   "   P r e m i e r e   " m a r g i n . p n g " )   | |   I m a g e S e a r c h ( & x ,   & y ,   A _ S c r e e n W i d t h   /   2 ,   0 ,   A _ S c r e e n W i d t h ,   A _ S c r e e n H e i g h t ,   " * 2   "   P r e m i e r e   " m a r g i n 2 . p n g " )   ; i f   y o u   d o n ' t   h a v e   y o u r   p r o j e c t   m o n i t o r   o n   y o u r   m a i n   c o m p u t e r   m o n i t o r ,   y o u   c a n   t r y   u s i n g   t h e   c o d e   a b o v e   i n s t e a d ,   C l a s s N N   v a l u e s   a r e   j u s t   a n   a b s o l u t e   p a i n   i n   t h e   n e c k   a n d   s o m e t i m e s   j u s t   c h o o s e   t o   b r e a k   f o r   a b s o l u t e l y   n o   r e a s o n   ( a n d   t h e y ' r e   s l o w   f o r   t h e   p r o j e c t   m o n i t o r   f o r   w h a t e v e r   r e a s o n ) .   M y   p r o j e c t   w i n d o w   i s   o n   t h e   r i g h t   s i d e   o f   m y   s c r e e n   ( w h i c h   i s   w h y   t h e   f i r s t   x   v a l u e   i s   A _ S c r e e n W i d t h / 2   -   i f   y o u r s   i s   o n   t h e   l e f t   y o u   c a n   s i m p l y   s w i t c h   t h e s e   t w o   v a l u e s  
 	 	 {  
 	 	 	 M o u s e M o v e ( x ,   y )  
 	 	 	 S e n d I n p u t ( " { C l i c k } " )  
 	 	 	 M o u s e M o v e ( o r i g X ,   o r i g Y )  
 	 	 	 b l o c k O f f ( )  
 	 	 	 r e t u r n  
 	 	 }  
 	 e l s e  
 	 	 {  
 	 	 	 b l o c k O f f ( )  
 	 	 	 t o o l C u s t ( " t h e   m a r g i n   b u t t o n " , ,   1 )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   m a r g i n   b u t t o n " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 }  
 }  
 ; P g D n : : u n a s s i g n e d ( )  
  
 e : : p r e s e t ( " H i g h p a s s   M e " )  
 d : : p r e s e t ( " h f l i p " )  
 c : : p r e s e t ( " v f l i p " )  
 ; E n d : :  
  
 w : : u n a s s i g n e d ( )  
 s : : p r e s e t ( " c r o p t o m " )  
 x : : f x S e a r c h ( )  
 ; F 1 5 : : u n a s s i g n e d ( )  
  
 q : : u n a s s i g n e d ( )  
 a : : u n a s s i g n e d ( )  
 z : : u n a s s i g n e d ( )  
 F 1 6 : : u n a s s i g n e d ( )  
  
 ; T a b : : u n a s s i g n e d ( )  
 E s c : : u n a s s i g n e d ( )  
 F 1 3 : : u n a s s i g n e d ( )  
 H o m e : : u n a s s i g n e d ( )  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   A f t e r F X . e x e " )   a n d   g e t K e y S t a t e ( " F 2 4 " ,   " P " )  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; F 2 4 : : r e t u r n   ; t h i s   l i n e   i s   m a n d a t o r y   f o r   p r o p e r   f u n c t i o n a l i t y  
  
 B a c k S p a c e : : u n a s s i g n e d ( )  
 S C 0 2 8 : : u n a s s i g n e d ( )  
 E n t e r : : u n a s s i g n e d ( )  
 ; R i g h t : : u n a s s i g n e d ( )  
  
 p : : m o t i o n B l u r ( )  
 S C 0 2 7 : : u n a s s i g n e d ( )  
 / : : u n a s s i g n e d ( )  
 ; U p : : u n a s s i g n e d ( )  
  
 o : : u n a s s i g n e d ( )  
 l : : a e S c a l e A n d P o s ( )  
 . : : u n a s s i g n e d ( )  
 ; D o w n : : u n a s s i g n e d ( )  
  
 i : : u n a s s i g n e d ( )  
 k : : u n a s s i g n e d ( )  
 , : : u n a s s i g n e d ( )  
 ; L e f t : : u n a s s i g n e d ( )  
  
 u : : u n a s s i g n e d ( )  
 j : : u n a s s i g n e d ( )  
 m : : u n a s s i g n e d ( )  
 ; P g U p : : u n a s s i g n e d ( )  
  
 y : : u n a s s i g n e d ( )  
 ; h : : u n a s s i g n e d ( )  
 n : : u n a s s i g n e d ( )  
 ; S p a c e : : u n a s s i g n e d ( )  
  
 t : : u n a s s i g n e d ( )  
 g : : u n a s s i g n e d ( )  
 b : : u n a s s i g n e d ( )  
  
 r : : u n a s s i g n e d ( )  
 f : : u n a s s i g n e d ( )  
 v : : u n a s s i g n e d ( )  
 ; P g D n : : u n a s s i g n e d ( )  
  
 e : : u n a s s i g n e d ( )  
 d : : u n a s s i g n e d ( )  
 c : : u n a s s i g n e d ( )  
 E n d : : u n a s s i g n e d ( )  
  
 w : : a e P r e s e t ( " D r o p   S h a d o w " )  
 s : : u n a s s i g n e d ( )  
 x : : u n a s s i g n e d ( )  
 ; F 1 5 : : u n a s s i g n e d ( )  
  
 q : : u n a s s i g n e d ( )  
 a : : u n a s s i g n e d ( )  
 z : : u n a s s i g n e d ( )  
 F 1 6 : : u n a s s i g n e d ( )  
  
 ; T a b : : u n a s s i g n e d ( )  
 E s c : : u n a s s i g n e d ( )  
 F 1 3 : : u n a s s i g n e d ( )  
 H o m e : : u n a s s i g n e d ( )  
  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 # H o t I f   g e t K e y S t a t e ( " F 2 4 " ,   " P " )   a n d   W i n A c t i v e ( " a h k _ e x e   P h o t o s h o p . e x e " )  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; F 2 4 : : r e t u r n   ; t h i s   l i n e   i s   m a n d a t o r y   f o r   p r o p e r   f u n c t i o n a l i t y  
  
 B a c k S p a c e : : u n a s s i g n e d ( )  
 S C 0 2 8 : : u n a s s i g n e d ( )  
 E n t e r : : u n a s s i g n e d ( )  
 ; R i g h t : : u n a s s i g n e d ( )  
  
 p : : S e n d I n p u t ( " ! t "   " b { R i g h t } g " )   ; o p e n   g a u s s i a n   b l u r   ( s h o u l d   r e a l l y   j u s t   u s e   t h e   i n b u i l t   h o t k e y   b u t   u h .   p h o t o s h o p   i s   s m e l l y   d o n ' t   @   m e )  
 S C 0 2 7 : : p s P r o p ( " s c a l e . p n g " )   ; t h i s   a s s u m e s   y o u   h a v e   h / w   l i n k e d .   Y o u ' l l   n e e d   m o r e   l o g i c   i f   y o u   w a n t   s e p a r a t e   v a l u e s  
 / : : u n a s s i g n e d ( )  
 ; U p : : u n a s s i g n e d ( )  
 o : : u n a s s i g n e d ( )  
 l : : p s P r o p ( " x . p n g " )  
 . : : p s P r o p ( " y . p n g " )  
 ; D o w n : : u n a s s i g n e d ( )  
  
 i : : u n a s s i g n e d ( )  
 k : : u n a s s i g n e d ( )  
 , : : u n a s s i g n e d ( )  
 ; L e f t : : u n a s s i g n e d ( )  
  
 u : : p s P r o p ( " r o t a t e . p n g " )  
 j : : u n a s s i g n e d ( )  
 m : : u n a s s i g n e d ( )  
 ; P g U p : : u n a s s i g n e d ( )  
  
 y : : u n a s s i g n e d ( )  
 ; h : : u n a s s i g n e d ( )  
 n : : u n a s s i g n e d ( )  
 ; S p a c e : : u n a s s i g n e d ( )  
  
 t : : u n a s s i g n e d ( )  
 g : : u n a s s i g n e d ( )  
 b : : u n a s s i g n e d ( )  
  
 r : : u n a s s i g n e d ( )  
 f : : u n a s s i g n e d ( )  
 v : : u n a s s i g n e d ( )  
 ; P g D n : : u n a s s i g n e d ( )  
  
 e : : u n a s s i g n e d ( )  
 d : : u n a s s i g n e d ( )  
 c : : u n a s s i g n e d ( )  
 E n d : : u n a s s i g n e d ( )  
  
 w : : u n a s s i g n e d ( )  
 s : : u n a s s i g n e d ( )  
 x : : u n a s s i g n e d ( )  
 ; F 1 5 : : u n a s s i g n e d ( )  
  
 q : : u n a s s i g n e d ( )  
 a : : u n a s s i g n e d ( )  
 z : : u n a s s i g n e d ( )  
 F 1 6 : : u n a s s i g n e d ( )  
  
 ; T a b : : u n a s s i g n e d ( )  
 E s c : : u n a s s i g n e d ( )  
 F 1 3 : : u n a s s i g n e d ( )  
 H o m e : : u n a s s i g n e d ( )  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 # H o t I f   g e t K e y S t a t e ( " F 2 4 " ,   " P " )   ; < - - E v e r y t h i n g   a f t e r   t h i s   l i n e   w i l l   o n l y   h a p p e n   o n   t h e   s e c o n d a r y   k e y b o a r d   t h a t   u s e s   F 2 4 .  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; F 2 4 : : r e t u r n   ; t h i s   l i n e   i s   m a n d a t o r y   f o r   p r o p e r   f u n c t i o n a l i t y  
  
 B a c k S p a c e : : u n a s s i g n e d ( )  
 S C 0 2 8 : : u n a s s i g n e d ( )   ;   '   k e y  
 E n t e r : : u n a s s i g n e d ( )  
 E n t e r   &   U p : : c l o s e O t h e r W i n d o w ( " a h k _ c l a s s   C a b i n e t W C l a s s " )  
 R i g h t : : u n a s s i g n e d ( )  
 R i g h t   &   U p : : n e w W i n ( " c l a s s " ,   " C a b i n e t W C l a s s " ,   " e x p l o r e r . e x e " )  
  
 p : : u n a s s i g n e d ( )  
 S C 0 2 7 : : u n a s s i g n e d ( )  
 / : : u n a s s i g n e d ( )  
 U p : : s w i t c h T o E x p l o r e r ( )  
  
 o : : u n a s s i g n e d ( )  
 l : : u n a s s i g n e d ( )  
 . : : u n a s s i g n e d ( )  
 D o w n : : s w i t c h T o P r e m i e r e ( )  
  
 i : : u n a s s i g n e d ( )  
 k : : u n a s s i g n e d ( )  
 , : : u n a s s i g n e d ( )  
 L e f t : : s w i t c h T o A E ( )  
  
 u : : u n a s s i g n e d ( )  
 j : : u n a s s i g n e d ( )  
 m : : u n a s s i g n e d ( )  
 S C 1 4 9 : : f i r e f o x T a p ( )  
 E n t e r   &   S C 1 4 9 : : c l o s e O t h e r W i n d o w ( " a h k _ c l a s s   M o z i l l a W i n d o w C l a s s " )  
 R i g h t   &   P g U p : : n e w W i n ( " e x e " ,   " f i r e f o x . e x e " ,   " f i r e f o x . e x e " )  
  
 y : : u n a s s i g n e d ( )  
 h : :   ; o p e n s   t h e   d i r e c t o r y   f o r   t h e   c u r r e n t   p r e m i e r e   p r o j e c t  
 {  
 	 i f   W i n E x i s t ( " A d o b e   P r e m i e r e   P r o " )   | |   W i n E x i s t ( " A d o b e   A f t e r   E f f e c t s " )  
 	 	 {  
 	 	 	 t r y   {  
 	 	 	 	 i f   W i n E x i s t ( " A d o b e   P r e m i e r e   P r o " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 N a m e   : =   W i n G e t T i t l e ( " A d o b e   P r e m i e r e   P r o " )  
 	 	 	 	 	 	 t i t l e c h e c k   : =   I n S t r ( N a m e ,   " A d o b e   P r e m i e r e   P r o   "   A _ Y e a r   "   - " )   ; c h a n g e   t h i s   y e a r   v a l u e   t o   y o u r   o w n   y e a r .   |   w e   a d d   t h e   "   - "   t o   a c c o m o d a t e   a   w i n d o w   t h a t   i s   l i t e r a l l y   j u s t   c a l l e d   " A d o b e   P r e m i e r e   P r o   [ Y e a r ] "  
 	 	 	 	 	 }  
 	 	 	 	 e l s e   i f   W i n E x i s t ( " A d o b e   A f t e r   E f f e c t s " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 N a m e   : =   W i n G e t T i t l e ( " A d o b e   A f t e r   E f f e c t s " )  
 	 	 	 	 	 	 t i t l e c h e c k   : =   I n S t r ( N a m e ,   " A d o b e   A f t e r   E f f e c t s   "   A _ Y e a r   "   - " )   ; c h a n g e   t h i s   y e a r   v a l u e   t o   y o u r   o w n   y e a r .   |   w e   a d d   t h e   "   - "   t o   a c c o m o d a t e   a   w i n d o w   t h a t   i s   l i t e r a l l y   j u s t   c a l l e d   " A d o b e   A f t e r   E f f e c t s   [ Y e a r ] "  
 	 	 	 	 	 }  
 	 	 	 	 d a s h L o c a t i o n   : =   I n S t r ( N a m e ,   " - " )  
 	 	 	 	 l e n g t h   : =   S t r L e n ( N a m e )   -   d a s h L o c a t i o n  
 	 	 	 }  
 	 	 	 i f   n o t   t i t l e c h e c k  
 	 	 	 	 {  
 	 	 	 	 	 t o o l C u s t ( " Y o u ' r e   o n   a   p a r t   o f   P r e m i e r e   t h a t   w o n ' t   c o n t a i n   t h e   p r o j e c t   p a t h " ,   2 0 0 0 )  
 	 	 	 	 	 r e t u r n  
 	 	 	 	 }  
 	 	 	 e n t i r e P a t h   : =   S u b S t r ( n a m e ,   d a s h L o c a t i o n   +   " 2 " ,   l e n g t h )  
 	 	 	 p a t h l e n g t h   : =   S t r L e n ( e n t i r e P a t h )  
 	 	 	 f i n a l S l a s h   : =   I n S t r ( e n t i r e P a t h ,   " \ " , ,   - 1 )  
 	 	 	 p a t h   : =   S u b S t r ( e n t i r e P a t h ,   1 ,   f i n a l S l a s h   -   " 1 " )  
 	 	 	 S p l i t P a t h ( p a t h , , , ,   & p a t h N a m e )  
 	 	 	 i f   W i n E x i s t ( " a h k _ c l a s s   C a b i n e t W C l a s s " ,   p a t h N a m e ,   " A d o b e "   " E d i t i n g   C h e c k l i s t " ,   " A d o b e " )  
 	 	 	 	 {  
 	 	 	 	 	 W i n A c t i v a t e ( " a h k _ c l a s s   C a b i n e t W C l a s s " ,   p a t h N a m e ,   " A d o b e " )  
 	 	 	 	 	 r e t u r n  
 	 	 	 	 }  
 	 	 	 R u n W a i t ( p a t h )  
 	 	 	 W i n W a i t ( " a h k _ c l a s s   C a b i n e t W C l a s s " ,   p a t h N a m e , ,   " A d o b e " )  
 	 	 	 W i n A c t i v a t e ( " a h k _ c l a s s   C a b i n e t W C l a s s " ,   p a t h N a m e ,   " A d o b e " )  
 	 	 }  
 	 e l s e  
 	 	 {  
 	 	 	 t o o l C u s t ( " A   P r e m i e r e / A E   i s n ' t   o p e n " )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d   n o t   f i n d   a   P r e m i e r e / A f t e r   E f f e c t s   w i n d o w " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 }  
 n : : u n a s s i g n e d ( )  
 S p a c e : : s w i t c h T o D i s c ( )  
 R i g h t   &   S p a c e : : n e w W i n ( " e x e " ,   " m s e d g e . e x e " ,   " m s e d g e . e x e " )  
 E n t e r   &   S p a c e : : c l o s e O t h e r W i n d o w ( " a h k _ e x e   m s e d g e . e x e " )  
  
 t : : u n a s s i g n e d ( )  
 g : : u n a s s i g n e d ( )  
 b : :   ; t h i s   m a c r o   i s   t o   f i n d   t h e   d i f f e r e n c e   b e t w e e n   2   2 4 h   t i m e c o d e s  
 {  
 	 c a l c u l a t e T i m e ( n u m b e r )   ; f i r s t   w e   c r e a t e   a   f u n c t i o n   t h a t   w i l l   r e t u r n   t h e   r e s u l t s   t h e   u s e r   i n p u t s  
 	 {  
 	 	 i f   n u m b e r   =   1  
 	 	 	 s t a r t o r e n d   : =   " S t a r t "  
 	 	 e l s e  
 	 	 	 s t a r t o r e n d   : =   " E n d "  
 	 	 s t a r t 1 :  
 	 	 t i m e   : =   I n p u t B o x ( " W r i t e   t h e   "   s t a r t o r e n d   "   h h m m   t i m e   h e r e ` n D o n ' t   u s e   ' : ' " ,   " I n p u t   "   s t a r t o r e n d   "   T i m e " ,   " w 2 0 0   h 1 1 0 " )  
 	 	 i f   t i m e . R e s u l t   =   " C a n c e l "  
 	 	 	 r e t u r n   0  
 	 	 L e n g t h 1   : =   S t r L e n ( t i m e . V a l u e )  
 	 	 i f   L e n g t h 1   ! =   " 4 "   | |   t i m e . V a l u e   >   2 3 5 9  
 	 	 	 {  
 	 	 	 	 M s g B o x ( " Y o u   d i d n ' t   w r i t e   i n   h h m m   f o r m a t ` n T r y   a g a i n " ,   s t a r t o r e n d   "   T i m e " ,   " 1 6 " )  
 	 	 	 	 g o t o   s t a r t 1  
 	 	 	 }  
 	 	 e l s e  
 	 	 	 r e t u r n   t i m e . V a l u e  
 	 }  
 	 t i m e 1   : =   c a l c u l a t e T i m e ( " 1 " )   ; t h e n   w e   c a l l   i t   t w i c e  
 	 i f   t i m e 1   =   0  
 	 	 r e t u r n  
 	 t i m e 2   : =   c a l c u l a t e T i m e ( " 2 " )  
 	 i f   t i m e 2   =   0  
 	 	 r e t u r n  
 	 d i f f   : =   D a t e D i f f ( " 2 0 2 2 0 1 0 1 "   t i m e 2 ,   " 2 0 2 2 0 1 0 1 "   t i m e 1 ,   " s e c o n d s " ) / " 3 6 0 0 "   ; d o   t h e   m a t h   t o   d e t e r m i n e   t h e   t i m e   d i f f e r e n c e  
 	 v a l u e   : =   R o u n d ( d i f f ,   2 )   ; r o u n d   t h e   r e s u l t   t o   2 d p  
 	 A _ C l i p b o a r d   : =   v a l u e   ; c o p y   i t   t o   t h e   c l i p b o a r d  
 	 t o o l C u s t ( d i f f   " ` n o r   "   v a l u e ,   2 0 0 0 )   ; a n d   c r e a t e   a   t o o l t i p   t o   s h o w   t h e   u s e r   b o t h   t h e   c o m p l e t e   a n s w e r   a n d   t h e   r o u n d e d   a n s w e r  
 }  
  
 r : : u n a s s i g n e d ( )  
 f : : u n a s s i g n e d ( )  
 v : : u n a s s i g n e d ( )  
 P g D n : : s w i t c h T o M u s i c ( )  
 R i g h t   &   P g D n : : m u s i c G U I ( )  
  
 e : : u n a s s i g n e d ( )  
 d : : u n a s s i g n e d ( )  
 c : : u n a s s i g n e d ( )  
 E n d : :   ; s e a r c h   f o r   c h e c k l i s t   f i l e  
 {  
 	 i f   W i n E x i s t ( " A d o b e   P r e m i e r e   P r o " )   | |   W i n E x i s t ( " A d o b e   A f t e r   E f f e c t s " )  
 	 	 o p e n C h e c k l i s t ( )  
 	 e l s e  
 	 	 {  
 	 	 	 d i r   : =   F i l e S e l e c t ( " D 2 " ,   " E : \ c o m m s " ,   " P i c k   t h e   E d i t   D i r e c t o r y " )  
 	 	 	 i f   d i r   =   " "  
 	 	 	 	 r e t u r n  
 	 	 	 S p l i t P a t h   d i r ,   & n a m e  
 	 	 	 i f   W i n E x i s t ( " C h e c k l i s t   -   "   n a m e )  
 	 	 	 	 {  
 	 	 	 	 	 t o o l C u s t ( " Y o u   a l r e a d y   h a v e   t h i s   c h e c k l i s t   o p e n " )  
 	 	 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " Y o u   a l r e a d y   h a v e   t h i s   c h e c k l i s t   o p e n " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 	 r e t u r n  
 	 	 	 	 }  
 	 	 	 i f   F i l e E x i s t ( d i r   " \ c h e c k l i s t . a h k " )  
 	 	 	 	 R u n ( d i r   " \ c h e c k l i s t . a h k " )  
 	 	 	 e l s e  
 	 	 	 	 t r y   {  
 	 	 	 	 	 F i l e C o p y ( " E : \ G i t h u b \ a h k \ c h e c k l i s t . a h k " ,   d i r )  
 	 	 	 	 	 R u n ( d i r   " \ c h e c k l i s t . a h k " )  
 	 	 	 	 }   c a t c h   a s   e   {  
 	 	 	 	 	 t o o l C u s t ( " F i l e   n o t   f o u n d " )  
 	 	 	 	 }  
 	 	 }  
 }  
  
 w : : u n a s s i g n e d ( )  
 s : : u n a s s i g n e d ( )  
 x : : u n a s s i g n e d ( )  
 F 1 5 : : s w i t c h T o P h o t o ( )  
  
 q : : u n a s s i g n e d ( )  
 a : : u n a s s i g n e d ( )  
 z : : u n a s s i g n e d ( )  
 F 1 6 : : s w i t c h T o E d g e ( )  
  
 ; T a b : : u n a s s i g n e d ( )  
 E s c : : u n a s s i g n e d ( )  
 F 1 3 : : u n a s s i g n e d ( )  
 H o m e : : u n a s s i g n e d ( )  
 ; ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~  
  
 / *  
 E v e r y t h i n g   I   u s e   s o   y o u   c a n   e a s y   c o p y   p a s t e   f o r   n e w   p r o g r a m s  
  
  
  
 B a c k S p a c e : : u n a s s i g n e d ( )  
 S C 0 2 8 : : u n a s s i g n e d ( )   ;   '   k e y  
 E n t e r : : u n a s s i g n e d ( )  
 ; R i g h t : : u n a s s i g n e d ( )  
  
 p : : u n a s s i g n e d ( )  
 S C 0 2 7 : : u n a s s i g n e d ( )  
 / : : u n a s s i g n e d ( )  
 ; U p : : u n a s s i g n e d ( )  
  
 o : : u n a s s i g n e d ( )  
 l : : u n a s s i g n e d ( )  
 . : : u n a s s i g n e d ( )  
 ; D o w n : : u n a s s i g n e d ( )  
  
 i : : u n a s s i g n e d ( )  
 k : : u n a s s i g n e d ( )  
 , : : u n a s s i g n e d ( )  
 ; L e f t : : u n a s s i g n e d ( )  
  
 u : : u n a s s i g n e d ( )  
 j : : u n a s s i g n e d ( )  
 m : : u n a s s i g n e d ( )  
 ; P g U p : : u n a s s i g n e d ( )  
  
 y : : u n a s s i g n e d ( )  
 h : : u n a s s i g n e d ( )  
 n : : u n a s s i g n e d ( )  
 ; S p a c e : : u n a s s i g n e d ( )  
  
 t : : u n a s s i g n e d ( )  
 g : : u n a s s i g n e d ( )  
 b : : u n a s s i g n e d ( )  
  
 r : : u n a s s i g n e d ( )  
 f : : u n a s s i g n e d ( )  
 v : : u n a s s i g n e d ( )  
 ; P g D n : : u n a s s i g n e d ( )  
  
 e : : u n a s s i g n e d ( )  
 d : : u n a s s i g n e d ( )  
 c : : u n a s s i g n e d ( )  
 E n d : : u n a s s i g n e d ( )  
  
 w : : u n a s s i g n e d ( )  
 ; s : : u n a s s i g n e d ( )  
 ; x : : u n a s s i g n e d ( )  
 ; F 1 5 : : u n a s s i g n e d ( )  
  
 q : : u n a s s i g n e d ( )  
 a : : u n a s s i g n e d ( )  
 z : : u n a s s i g n e d ( )  
 F 1 6 : : u n a s s i g n e d ( )  
  
 ; T a b : : u n a s s i g n e d ( )  
 E s c : : u n a s s i g n e d ( )  
 F 1 3 : : u n a s s i g n e d ( )  
 H o m e : : u n a s s i g n e d ( )  
   * / 