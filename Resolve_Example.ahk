S e t W o r k i n g D i r   A _ S c r i p t D i r     ;   E n s u r e s   a   c o n s i s t e n t   s t a r t i n g   d i r e c t o r y .  
 S e t D e f a u l t M o u s e S p e e d   0  
 # S i n g l e I n s t a n c e   F o r c e  
 ;   S e t N u m L o c k S t a t e   " A l w a y s O n "   ; u n c o m m e n t   i f   y o u   w a n t   n u m l o c k   t o   a l w a y s   b e   O N  
 ;   S e t C a p s L o c k S t a t e   " A l w a y s O f f "   ; u n c o m m e n t   i f   y o u   w a n t   c a p s l o c k   t o   a l w a y s   b e   O F F  
 T r a y S e t I c o n ( A _ W o r k i n g D i r   " \ S u p p o r t   F i l e s \ I c o n s \ r e s o l v e . p n g " )  
 # I n c l u d e   " F u n c t i o n s . a h k "   ; i n c l u d e s   f u n c t i o n   d e f i n i t i o n s   s o   t h e y   d o n ' t   c l o g   u p   t h i s   s c r i p t .   F u n c t i o n s . a h k   m u s t   b e   i n   t h e   s a m e   d i r e c t o r y   a s   t h i s   s c r i p t   ; i n c l u d e s   f u n c t i o n   d e f i n i t i o n s   s o   t h e y   d o n ' t   c l o g   u p   t h i s   s c r i p t  
  
 ; c h e c k s   t o   m a k e   s u r e   t h e   u s e r   i s   u s i n g   a   c o m p a t i b l e   v e r s i o n   o f   a h k  
 v e r C h e c k ( )  
  
 ; \ \ C U R R E N T   S C R I P T   V E R S I O N \ \ T h i s   i s   a   " s c r i p t "   l o c a l   v e r s i o n   a n d   d o e s n ' t   r e l a t e   t o   t h e   R e l e a s e   V e r s i o n  
 ; \ \ v 2 . 5 . 1  
 ; \ \ M i n i m u m   V e r s i o n   o f   " R e s o l v e . a h k "   R e q u i r e d   f o r   t h i s   s c r i p t  
 ; \ \ v 2 . 1 1  
  
 ; \ \ C U R R E N T   R E L E A S E   V E R S I O N  
 ; \ \ v 2 . 5 . 2  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ;   	 	 	 	 	 	 	 T H I S   S C R I P T   I S   F O R   v 2 . 0   O F   A U T O H O T K E Y  
 ; 	 	 	 	   	 	 	 	 I T   W I L L   N O T   R U N   I N   v 1 . 1  
 ;  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ;   T h i s   s c r i p t   w a s   c r e a t e d   b y   T o m s h i   ( h t t p s : / / w w w . y o u t u b e . c o m / c / t o m s h i i i ,   h t t p s : / / w w w . t w i t c h . t v / t o m s h i )  
 ;   I t s   p u r p o s e   i s   t o   p o r t   o v e r   s i m i l a r   m a c r o s   f r o m   m y   " M y   S c r i p t s . a h k "   t o   a l l o w   f a s t e r   e d i t i n g   w i t h i n   r e s o l v e   f o r   y o u   n o n   a d o b e   e d i t o r s  
 ;   Y o u   a r e   f r e e   t o   m o d i f y   t h i s   s c r i p t   t o   y o u r   o w n   p e r s o n a l   u s e s / n e e d s  
 ;   P l e a s e   g i v e   c r e d i t   t o   t h e   f o u n d a t i o n   i f   y o u   b u i l d   o n   t o p   o f   i t ,   o t h e r w i s e   y o u ' r e   f r e e   t o   d o   a s   y o u   w i s h  
 ;  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   ; W i n N o t A c t i v e ( " a h k _ e x e   R e s o l v e . e x e " )  
  
 ; a n y   c o d e   y o u   w a n t   t o   r u n   a l l   t h e   t i m e   s h o u l d   g o   h e r e  
  
 ;   / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / /  
  
 ;   A L L   P I X E L   V A L U E S   W I L L   N E E D   T O   B E   A D J U S T E D   I F   Y O U   A R E N ' T   U S I N G   A   1 4 4 0 p   M O N I T O R   ( A N D   M I G H T   S T I L L   E V E N   I F   Y O U   A R E )  
  
 ;   / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / / /  
  
 ;   T h i s   i s   a n   e x a m p l e   s c r i p t   I ' v e   c r e a t e d   f o r   d a v i n c i   r e s o l v e   p o r t i n g   o v e r   s o m e   s i m i l a r   f u n c t i o n a l i t y   I   u s e  
 ;   i n   m y   p r e m i e r e   s c r i p t s .   T h i n g s   a r e n ' t   a s   c l e a n   a n d   t h e r e   m a y   b e   b e t t e r   w a y s   t o   d o   t h i n g s  
 ;   k e e p   i n   m i n d   I   d o n ' t   u s e   r e s o l v e   a n d   I ' v e   j u s t   c o o k e d   t h i s   u p   a s   a n   e x a m p l e   f o r   y o u   t o   m e s s   w i t h   y o u r s e l f  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; 	 	 D A V I N C I   R E S O L V E  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   R e s o l v e . e x e " )  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; 	 	 k e y b o a r d   s h o r t c u t   r e p l a c e m e n t s   ( t h i s   i s   j u s t   t o   m a k e   t h i n g s   s i m i l a r   t o   h o w   I   u s e   p r e m i e r e .   R e a l i s t i c a l l y   r e p l a c i n g   t h e i r   k e y b i n d s   i n   R e s o l v e   i t s e l f   i s   F A R   b e t t e r )  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;   / / / / /   t h e s e   a l l   a s s u m e   y o u ' r e   u s i n g   r e s o l v e ' s   d e f a u l t   k e y b i n d s  
  
 q : : + [   ;   r e a s s i g n   s h i f t [   t o   r i p p l e   s t a r t   t o   p l a y h e a d   ; . . . o r   a s s i g n   i t   t o   q  
 w : : + ]   ;   r e a s s i g n   s h i f t ]   t o   r i p p l e   s t a r t   t o   p l a y h e a d   ; . . . o r   a s s i g n   i t   t o   w  
 ~ s : : ^ \   ;   c t r l   \   i s   h o w   t o   s p l i t   t r a c k s   i n   r e s o l v e   ; n e e d s   ~   o r   y o u   c a n ' t   s a v e   l m a o .   l i k e l y   b e t t e r   t o   j u s t   r e m a p   i n   r e s o l v e  
 X B u t t o n 2 : : M B u t t o n   ;   m i d d l e   m o u s e   i s   h o w   y o u   n o r m a l l y   s c r o l l   h o r i z o n t a l l y   i n   r e s o l v e ,   m i d d l e   m o u s e   i s   o b n o x i o u s   t o   p r e s s   t h o u g h  
 W h e e l R i g h t : : D o w n  
 W h e e l L e f t : : U p  
 ; c h a n g e   " n o r m a l   e d i t   m o d e "   t o   v   t o   m a k e   i t   l i k e   p r e m i e r e  
 ; c h a n g e   " b l a d e   e d i t   m o d e "   t o   c   t o   m a k e   i t   l i k e   h o w   I   u s e   p r e m i e r e  
 ; c h a n g e   " r i p p l e   d e l e t e "   t o   s h i f t   c   t o   m a k e   i t   l i k e   h o w   I   u s e   p r e m i e r e  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; 	 	 h o l d   a n d   d r a g   ( o r   c l i c k )  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 F 1 : : r v a l h o l d ( " z o o m " ,   " 6 0 " ,   " 1 " )   ; p r e s s   t h e n   h o l d   F 1   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   x   p o s i t i o n .   L e t   g o   o f   F 1   t o   c o n f i r m .   T a p   t o   r e s e t  
 F 2 : : r v a l h o l d ( " p o s i t i o n " ,   " 8 0 " ,   " 1 " )   ; p r e s s   t h e n   h o l d   F 2   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   x   p o s i t i o n .   L e t   g o   o f   F 2   t o   c o n f i r m .   T a p   t o   r e s e t  
 F 3 : : r v a l h o l d ( " p o s i t i o n " ,   " 2 1 0 " ,   " 1 " )   ; p r e s s   t h e n   h o l d   F 3   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   y   p o s i t i o n .   L e t   g o   o f   F 3   t o   c o n f i r m .   T a p   t o   r e s e t  
 F 4 : : r v a l h o l d ( " r o t a t i o n " ,   " 2 4 0 " ,   " 0 " )   ; p r e s s   t h e n   h o l d   F 4   a n d   d r a g   t o   i n c r e a s e / d e c r e s e   r o t a t i o n .   L e t   g o   o f   F 4   t o   c o n f i r m .   T a p   t o   r e s e t  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; 	 	 f l i p s  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ! h : : r f l i p ( " h o r i z o n t a l " )   ; f l i p   h o r i z o n t a l l y .   w o n ' t   d o   a n y t h i n g   i f   y o u ' r e   s c r o l l e d   d o w n   i n   t h e   " v i d e o "   t a b   a l r e a d y .   y o u   c o u l d   a d d   a   w h e e l u p   i f   y o u   w a n t e d  
 ! v : : r f l i p ( " v e r t i c a l " )   ; f l i p   v e r t i c a l l y .   w o n ' t   d o   a n y t h i n g   i f   y o u ' r e   s c r o l l e d   d o w n   i n   t h e   " v i d e o "   t a b   a l r e a d y .   y o u   c o u l d   a d d   a   w h e e l u p   i f   y o u   w a n t e d  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; 	 	 S c a l e   A d j u s t m e n t s  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ^ 1 : : R s c a l e ( " 1 " ,   " z o o m " ,   " 6 0 " )   ; m a k e s   t h e   s c a l e   o f   c u r r e n t   s e l e c t e d   c l i p   1 0 0  
 ^ 2 : : R s c a l e ( " 2 " ,   " z o o m " ,   " 6 0 " )   ; m a k e s   t h e   s c a l e   o f   c u r r e n t   s e l e c t e d   c l i p   2 0 0  
 ^ 3 : : R s c a l e ( " 3 " ,   " z o o m " ,   " 6 0 " )   ; m a k e s   t h e   s c a l e   o f   c u r r e n t   s e l e c t e d   c l i p   3 0 0  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 D r a g   a n d   D r o p   E f f e c t   P r e s e t s  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ! g : : R E f f e c t ( " o p e n f x " ,   " g a u s s i a n   b l u r " )   ; h o v e r   o v e r   a   t r a c k   o n   t h e   t i m e l i n e ,   p r e s s   t h i s   h o t k e y ,   t h e n   w a t c h   a s   a h k   d r a g s   t h a t   " f a v o u r i t e "   o n t o   t h e   h o v e r e d   t r a c k .  
 ;   t h i s   i s   s e t   u p   a s   a   p r e s e t   s o   y o u   c a n   e a s i l y   a d d   f u r t h e r   h o t k e y s   w i t h   1   l i n e   a n d   n e w   d e f i n e d   c o o r d s .  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 b e t t e r   t i m e l i n e   m o v e m e n t  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ; s e t   c o l o u r s  
 t i m e l i n e 1   : =   0 x 3 E 3 E 4 2   ; t i m e l i n e   c o l o r   i n s i d e   t h e   i n / o u t   p o i n t s   O N   a   t a r g e t e d   t r a c k  
 t i m e l i n e 2   : =   0 x 3 9 3 9 3 E   ; t i m e l i n e   c o l o r   o f   t h e   s e p a r a t i n g   L I N E S   b e t w e e n   t a r g e t e d   A N D   n o n   t a r g e t e d   t r a c k s   i n s i d e   t h e   i n / o u t   p o i n t s  
 t i m e l i n e 3   : =   0 x 2 8 2 8 2 E   ; t h e   t i m e l i n e   c o l o r   i n s i d e   i n / o u t   p o i n t s   o n   a   N O N   t a r g e t e d   t r a c k  
 t i m e l i n e 4   : =   0 x 1 E 1 E 2 2   ; t h e   c o l o r   o f   t h e   b a r e   t i m e l i n e   N O T   i n s i d e   t h e   i n   o u t   p o i n t s  
 t i m e l i n e 5   : =   0 x 3 E 3 E 4 2   ; t h e   c o l o r   o f   a   S E L E C T E D   b l a n k   s p a c e   o n   t h e   t i m e l i n e ,   N O T   i n   t h e   i n / o u t   p o i n t s  
 t i m e l i n e 6   : =   0 x 3 E 3 E 4 2   ; t h e   c o l o r   o f   a   S E L E C T E D   b l a n k   s p a c e   o n   t h e   t i m e l i n e ,   I N   t h e   i n / o u t   p o i n t s ,   o n   a   T A R G E T E D   t r a c k  
 t i m e l i n e 7   : =   0 x 2 8 2 8 2 E   ; t h e   c o l o r   o f   a   S E L E C T E D   b l a n k   s p a c e   o n   t h e   t i m e l i n e ,   I N   t h e   i n / o u t   p o i n t s ,   o n   a n   U N T A R G E T E D   t r a c k  
 p l a y h e a d   : =   0 x 5 7 2 5 2 3  
 p l a y h e a d 2   : =   0 x E 6 4 B 3 D  
 R b u t t o n : :   ; p o r t s   t h e   f u n c t i o n a l i t y   o f   " r i g h t   c l i c k   p r e m i e r e . a h k "   a s   b e s t   a s   p o s s i b l e .  
 {  
         s c r u b   : =   0  
         c o o r d w ( )  
         b l o c k O n ( )  
         M o u s e G e t P o s   & x p o s ,   & y p o s  
         i f   n o t   I m a g e S e a r c h ( & e d i t x ,   & e d i t Y ,   A _ S c r e e n W i d t h   /   3 ,   A _ S c r e e n H e i g h t   -   1 5 0 ,   A _ S c r e e n W i d t h ,   A _ S c r e e n H e i g h t ,   " * 2   "   R e s o l v e   " e d i t . p n g " )  
                 {  
                         S e n d I n p u t ( " { R B u t t o n } " )  
                         b l o c k O f f ( )  
                         r e t u r n  
                 }  
         i f   I m a g e S e a r c h ( & s p e a k X ,   & s p e a k Y ,   A _ S c r e e n W i d t h   *   0 . 7 ,   0 ,   A _ S c r e e n W i d t h ,   A _ S c r e e n H e i g h t ,   " * 2   "   R e s o l v e   " s p e a k e r 1 . p n g " )   | |   I m a g e S e a r c h ( & s p e a k X ,   & s p e a k Y ,   A _ S c r e e n W i d t h   *   0 . 7 ,   0 ,   A _ S c r e e n W i d t h ,   A _ S c r e e n H e i g h t ,   " * 2   "   R e s o l v e   " s p e a k e r 2 . p n g " )  
                 {  
                         s c r u b   : =   s p e a k Y   +   7 4  
                         g o t o   c o n t  
                 }  
         e l s e  
                 {  
                         b l o c k O f f ( )  
                         t o o l C u s t ( " C o u l d n ' t   f i n d   r e f e r e n c e   p o i n t   f o r   s c r u b   b a r " ,   2 0 0 0 )  
                         e r r o r L o g ( A _ T h i s H o t k e y ,   " C o u l d n ' t   f i n d   r e f e r e n c e   p o i n t   f o r   s c r u b   b a r " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
                         r e t u r n  
                 }  
         c o n t :  
         i f   y p o s   <   s c r u b  
                 {  
                         S e n d I n p u t ( " { R b u t t o n } " )  
                         b l o c k O f f  
                         r e t u r n  
                 }  
         C o l o r   : =   P i x e l G e t C o l o r ( x p o s ,   y p o s )  
         / *   i f   ( C o l o r   =   t i m e l i n e 5   | |   C o l o r   =   t i m e l i n e 6   | |   C o l o r   =   t i m e l i n e 7 )   ; t h e s e   a r e   t h e   t i m e l i n e   c o l o r s   o f   a   s e l e c t e d   c l i p   o r   b l a n k   s p a c e ,   i n   o r   o u t s i d e   o f   i n / o u t   p o i n t s .  
                 S e n d I n p u t ( r e s o l v e D e s e l e c t )  
                 * /  
                 ; n o t   s u r e   i f   t h e   a b o v e   i s   r e a l l y   n e e d e d   w i t h i n   r e s o l v e .   I ' m   n o t   e n t i r e l y   s u r e   t h e i r   p u r p o s e   w i t h i n   p r e m i e r e   a n d   a s   I   d o n ' t   u s e   r e s o l v e   I ' m   u n s u r e   o f   t h e   e d g e   c a s e   s c e n a r i o s   y o u ' d   r u n   i n t o   w h e r e   t h i s   m a y   b e   n e c e s s a r y  
         i f   ( C o l o r   =   t i m e l i n e 1   | |   C o l o r   =   t i m e l i n e 2   | |   C o l o r   =   t i m e l i n e 3   | |   C o l o r   =   t i m e l i n e 4   | |   C o l o r   =   t i m e l i n e 5   | |   C o l o r   =   t i m e l i n e 6   | |   C o l o r   =   t i m e l i n e 7   | |   C o l o r   =   p l a y h e a d   | |   C o l o r   =   p l a y h e a d 2 )  
                 {  
                         i f   G e t K e y S t a t e ( " R b u t t o n " ,   " P " )  
                                 {  
                                         M o u s e M o v e ( x p o s ,   s c r u b )   ; t h i s   w i l l   w a r p   t h e   m o u s e   t o   t h e   t o p   p a r t   o f   y o u r   t i m e l i n e   d e f i n e d   b y   & t i m e l i n e  
                                         S e n d I n p u t ( " { C l i c k   D o w n } " )  
                                         M o u s e M o v e ( x p o s ,   y p o s )  
                                         b l o c k O f f ( )  
                                         K e y W a i t ( A _ T h i s H o t k e y )  
                                         S e n d I n p u t ( " { C l i c k   U p } " )  
                                         r e t u r n  
                                 }  
                         S e n d I n p u t ( r e s o l v e D e s e l e c t )   ; i n   c a s e   y o u   e n d   u p   i n s i d e   t h e   " d e l e t e "   r i g h t   c l i c k   m e n u   f r o m   t h e   t i m e l i n e  
                         b l o c k O f f ( )  
                         r e t u r n  
                 }  
         e l s e  
                 s e n d i n p u t ( " { R b u t t o n } " )   ; t h i s   i s   t o   m a k e   u p   f o r   t h e   l a c k   o f   a   ~   i n   f r o n t   o f   R b u t t o n .   . . .   ~ R b u t t o n .   I t   a l l o w s   t h e   c o m m a n d   t o   p a s s   t h r o u g h ,   b u t   o n l y   i f   t h e   a b o v e   c o n d i t i o n s   w e r e   N O T   m e t .  
                 b l o c k O f f ( )  
 }  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 g a i n  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 N u m p a d 1 : : r g a i n ( " - 2 " )  
 N u m p a d 2 : : r g a i n ( " 2 " )  
 N u m p a d 3 : : r g a i n ( " 6 " ) 