; \ \ C U R R E N T   R E L E A S E   V E R S I O N  
 g l o b a l   M y R e l e a s e   : =   " v 2 . 5 . 2 "  
  
 # S i n g l e I n s t a n c e   F o r c e  
 S e t W o r k i n g D i r   A _ S c r i p t D i r   ; s e t s   t h e   s c r i p t s   w o r k i n g   d i r e c t o r y   t o   t h e   d i r e c t o r y   i t ' s   l a u n c h e d   f r o m  
 S e t N u m L o c k S t a t e   " A l w a y s O n "   ; s e t s   n u m l o c k   t o   a l w a y s   o n   ( y o u   c a n   s t i l l   i t   f o r   m a c r o s )  
 S e t C a p s L o c k S t a t e   " A l w a y s O f f "   ; s e t s   c a p s   l o c k   t o   a l w a y s   o f f   ( y o u   c a n   s t i l l   i t   f o r   m a c r o s )  
 S e t S c r o l l L o c k S t a t e   " A l w a y s O f f "   ; s e t s   s c r o l l   l o c k   t o   a l w a y s   o f f   ( y o u   c a n   s t i l l   i t   f o r   m a c r o s )  
 S e t D e f a u l t M o u s e S p e e d   0   ; s e t s   d e f a u l t   M o u s e M o v e   s p e e d   t o   0   ( i n s t a n t )  
 S e t W i n D e l a y   0   ; s e t s   d e f a u l t   W i n M o v e   s p e e d   t o   0   ( i n s t a n t )  
 A _ M a x H o t k e y s P e r I n t e r v a l   : =   4 0 0   ; B E   V E R Y   C A R E F U L   W I T H   T H I S   S E T T I N G .   I f   y o u   m a k e   t h i s   v a l u e   t o o   h i g h ,   y o u   c o u l d   r u n   i n t o   i s s u e s   i f   y o u   a c c i d e n t a l l y   c r e a t e   a n   i n f i n i t e   l o o p  
 T r a y S e t I c o n ( A _ W o r k i n g D i r   " \ S u p p o r t   F i l e s \ I c o n s \ m y s c r i p t . p n g " )   ; c h a n g e s   t h e   i c o n   t h i s   s c r i p t   u s e s   i n   t h e   t a s k b a r  
 # I n c l u d e   " F u n c t i o n s . a h k "   ; i n c l u d e s   f u n c t i o n   d e f i n i t i o n s   s o   t h e y   d o n ' t   c l o g   u p   t h i s   s c r i p t .   M S _ F u n c t i o n s   m u s t   b e   i n   t h e   s a m e   d i r e c t o r y   a s   t h i s   s c r i p t   o t h e r w i s e   y o u   n e e d   a   f u l l   f i l e p a t h  
 # I n c l u d e   " r i g h t   c l i c k   p r e m i e r e . a h k "   ; I   h a v e   t h i s   h e r e   i n s t e a d   o f   r u n n i n g   i t   s e p a r a t e l y   b e c a u s e   s o m e t i m e s   i f   t h e   m a i n   s c r i p t   l o a d s   a f t e r   t h i s   o n e   t h i n g s   g e t   f u n k y   a n d   b r e a k   b e c a u s e   o f   p r i o r i t i e s   a n d   s t u f f  
  
 ; \ \ C U R R E N T   S C R I P T   V E R S I O N \ \ T h i s   i s   a   " s c r i p t "   l o c a l   v e r s i o n   a n d   d o e s n ' t   r e l a t e   t o   t h e   R e l e a s e   V e r s i o n  
 ; \ \ v 2 . 1 7 . 7  
 ; \ \ C u r r e n t   Q M K   K e y b o a r d   V e r s i o n \ \ A t   t i m e   o f   l a s t   c o m m i t  
 ; \ \ v 2 . 8 . 5  
  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ;   	 	 	 	 	 	 	 	 	 	 	 	 	 	 T H I S   S C R I P T   I S   F O R   v 2 . 0   O F   A U T O H O T K E Y  
 ; 	 	 	 	   	 	 	 	 	 	 	 	 	 	 	 I T   W I L L   N O T   R U N   I N   v 1 . 1  
 ; 	 	 	 	 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ; 	 	 	 	 	 	 	 	 	 	 	 	 E v e r y t h i n g   i n   t h i s   s c r i p t   i s   f u n c t i o n a l   w i t h i n   v 2 . 0  
 ; 	 	 	 	 	 	 	 	 	 	 	 a n y   c o d e   l i k e   " b l o c k o n ( ) "   " c o o r d s ( ) "   e t c   a r e   a l l   d e f i n e d  
 ; 	 	 	 	 	 	 	 	 	 	 i n   t h e   v a r i o u s   F u n c t i o n s . a h k   s c r i p t s .   L o o k   t h e r e   f o r   s p e c i f i c   c o d e   t o   e d i t  
 ;  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ;   T h i s   s c r i p t   w a s   c r e a t e d   b y   &   f o r   T o m s h i   ( h t t p s : / / w w w . y o u t u b e . c o m / c / t o m s h i i i ,   h t t p s : / / w w w . t w i t c h . t v / t o m s h i )  
 ;   I t s   p u r p o s e   i s   t o   h e l p   s p e e d   u p   e d i t i n g   a n d   r a n d o m   i n t e r a c t i o n s   w i t h   w i n d o w s .  
 ;   C o p y r i g h t   ( C )   < 2 0 2 2 >     < T o m   T o m s h i >  
 ;  
 ;   Y o u   a r e   f r e e   t o   m o d i f y   t h i s   s c r i p t   t o   y o u r   o w n   p e r s o n a l   u s e s / n e e d s ,   b u t   y o u   m u s t   f o l l o w   t h e   t e r m s   s h o w n   i n   t h e   l i c e n s e   f i l e   i n   t h e   r o o t   d i r e c t o r y   o f   t h i s   r e p o   ( b a s i c a l l y   j u s t   k e e p   s o u r c e   c o d e   a v a i l a b l e )  
 ;   Y o u   s h o u l d   h a v e   r e c e i v e d   a   c o p y   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   a l o n g   w i t h   t h i s   s c r i p t .     I f   n o t ,   s e e   < h t t p s : / / w w w . g n u . o r g / l i c e n s e s / >  
 ;  
 ;   P l e a s e   g i v e   c r e d i t   t o   t h e   f o u n d a t i o n   i f   y o u   b u i l d   o n   t o p   o f   i t ,   s i m i l a r   t o   h o w   I   h a v e   b e l o w ,   o t h e r w i s e   y o u ' r e   f r e e   t o   d o   a s   y o u   w i s h  
 ;   Y o u t u b e   p l a y l i s t   g o i n g   t h r o u g h   s o m e   o f   m y   A H K   c h a n g e s / u p d a t e s   ( h t t p s : / / w w w . y o u t u b e . c o m / p l a y l i s t ? l i s t = P L 8 t x O l L U Z i q X X r 2 P N O s N S X e C B 1 1 7 1 l Q 1 b )  
 ;  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 ;   A   c h u n k   o f   t h e   c o d e   i n   t h e   o r i g i n a l   v e r s i o n s   o f   t h i s   s c r i p t   w a s   e i t h e r   d i r e c t l y   i n s p i r e d   b y ,   o r   o r i g i n a l l y   c o p i e d   f r o m   T a r a n   f r o m   L T T   ( h t t p s : / / g i t h u b . c o m / T a r a n V H / )   b e f o r e  
 ;   I   e v e n t u a l l y   m o d i f i e d   i t   t o   w o r k   w i t h   v 2 . 0   o f   a h k   a n d   m a d e   a   b u n c h   o f   o t h e r   c h a n g e s .   H i s   v i d e o s   o n   t h e   s u b j e c t   a r e   w h a t   g o t   m e   i n t o   A H K   t o   b e g i n   w i t h   a n d   w h a t   b r o u g h t   t h e   f o u n d a t i o n   o f   t h e   o r i g i n a l  
 ;   v e r s i o n   o f   t h i s   s c r i p t   t o   l i f e .  
 ;   I   u s e   a   s t r e a m d e c k   t o   r u n   a   l o t   o f   m y   s c r i p t s   w h i c h   i s   w h y   a   b u n c h   o f   t h e m   a r e   s e p a r a t e d   o u t   i n t o   t h e i r   o w n   s c r i p t s   i n   t h e   \ S t r e a m d e c k   A H K \   f o l d e r .  
  
 ;   I   u s e   t o   u s e   n o t e p a d + +   t o   e d i t   t h i s   s c r i p t ,   i f   y o u   w a n t   p r o p e r   s y n t a x   h i g h l i g h t i n g   i n   n o t e p a d + +   f o r   a h k   g o   h e r e :   h t t p s : / / w w w . a u t o h o t k e y . c o m / b o a r d s / v i e w t o p i c . p h p ? t = 5 0  
 ;   I   n o w   u s e   V S C o d e   w h i c h   c a n   b e   f o u n d   h e r e :   h t t p s : / / c o d e . v i s u a l s t u d i o . c o m /  
 ;   A H K   ( a n d   v 2 . 0 )   s y n t a x   h i g h l i g h t i n g   c a n   b e   i n s t a l l e d   w i t h i n   t h e   p r o g r a m   i t s e l f .  
  
 ;   I f   y o u   E V E R   g e t   s t u c k   i n   s o m e   c o d e   w i t h i n   a n y   o f   t h e s e   s c r i p t s   R E F R E S H   T H E   S C R I P T   -   b y   d e f a u l t   I   h a v e   i t   s e t   t o   w i n   +   s h i f t   +   r   -   a n d   i t   w i l l   w o r k   a n y w h e r e   ( u n l e s s   y o u ' r e   c l i c k e d   o n   a   p r o g r a m   r u n   a s   a d m i n )   i f   r e f r e s h i n g   d o e s n ' t   w o r k   o p e n   u p   t a s k   m a n a g e r   w i t h   c t r l   +   s h i f t   +   e s c   a n d   u s e   y o u r   k e y b o a r d   t o   f i n d   a l l   i n s t a n c e s   o f   a u t o h o t k e y   a n d   f o r c e   c l o s e   t h e m  
  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ;  
 ; 	 	 	 	 S T A R T U P  
 ;  
 ;   = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 g e n e r a t e ( M y R e l e a s e )   ; g e n e r a t e s / r e p l a c e s   t h e   ` s e t t i n g s . i n i `   f i l e   e v e r y   r e l e a s e  
 l o c a t i o n R e p l a c e ( )   ; r u n s   t h e   l o c a t i o n   v a r i a b l e   c h e c k  
 v e r C h e c k ( )   ; c h e c k s   t o   m a k e   s u r e   t h e   u s e r   i s   u s i n g   a   c o m p a t i b l e   v e r s i o n   o f   a h k  
 t r a y M e n ( )   ; a d d s   t h e   a b i l i t y   t o   t o g g l e   c h e c k i n g   f o r   u p d a t e s   w h e n   y o u   r i g h t   c l i c k   o n   t h i s   s c r i p t s   t r a y   i c o n  
 u p d a t e C h e c k e r ( M y R e l e a s e )   ; r u n s   t h e   u p d a t e   c h e c k e r  
 f i r s t C h e c k ( M y R e l e a s e )   ; r u n s   t h e   f i r s t C h e c k ( )   f u n c t i o n  
 o l d E r r o r ( )   ; r u n s   t h e   l o o p   t o   d e l e t e   o l d   l o g   f i l e s  
 a d o b e T e m p ( M y R e l e a s e )   ; r u n s   t h e   l o o p   t o   d e l e t e   c a c h e   f i l e s  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 W i n d o w s  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   ; c o d e   b e l o w   h e r e   ( u n t i l   t h e   n e x t   # H o t I f )   w i l l   w o r k   a n y w h e r e  
 # S u s p e n d E x e m p t   ; t h i s   a n d   t h e   b e l o w   " f a l s e "   a r e   r e q u i r e d   s o   y o u   c a n   t u r n   o f f   s u s p e n d i n g   t h i s   s c r i p t   w i t h   t h e   h o t k e y   l i s t e d   b e l o w  
 ; r e l o a d e r H o t k e y ;  
 # + r : :   ; t h i s   r e l o a d   s c r i p t   w i l l   n o w   a t t e m p t   t o   r e l o a d   a l l   o f   m y   s c r i p t s ,   n o t   o n l y   t h i s   m a i n   s c r i p t  
 {  
 	 D e t e c t H i d d e n W i n d o w s   T r u e     ;   A l l o w s   a   s c r i p t ' s   h i d d e n   m a i n   w i n d o w   t o   b e   d e t e c t e d .  
 	 S e t T i t l e M a t c h M o d e   2     ;   A v o i d s   t h e   n e e d   t o   s p e c i f y   t h e   f u l l   p a t h   o f   t h e   f i l e   b e l o w .  
 	 i f   W i n E x i s t ( " Q M K   K e y b o a r d . a h k   -   A u t o H o t k e y " )  
 	 	 P o s t M e s s a g e   0 x 0 1 1 1 ,   6 5 3 0 3 , , ,   " Q M K   K e y b o a r d . a h k   -   A u t o H o t k e y "  
 	 i f   W i n E x i s t ( " R e s o l v e _ E x a m p l e . a h k   -   A u t o H o t k e y " )  
 	 	 P o s t M e s s a g e   0 x 0 1 1 1 ,   6 5 3 0 3 , , ,   " R e s o l v e _ E x a m p l e . a h k   -   A u t o H o t k e y "  
 	 i f   W i n E x i s t ( " t e x t r e p l a c e . a h k   -   A u t o H o t k e y " )  
 	 	 P o s t M e s s a g e   0 x 0 1 1 1 ,   6 5 3 0 3 , , ,   " t e x t r e p l a c e . a h k   -   A u t o H o t k e y "  
 	 ; i f   W i n E x i s t ( " r i g h t   c l i c k   p r e m i e r e . a h k   -   A u t o H o t k e y " )  
 	 ; 	 P o s t M e s s a g e   0 x 0 1 1 1 ,   6 5 3 0 3 , , ,   " r i g h t   c l i c k   p r e m i e r e . a h k   -   A u t o H o t k e y "  
 	 i f   W i n E x i s t ( " a u t o s a v e . a h k   -   A u t o H o t k e y " )  
 	 	 P o s t M e s s a g e   0 x 0 1 1 1 ,   6 5 3 0 3 , , ,   " a u t o s a v e . a h k   -   A u t o H o t k e y "  
 	 i f   W i n E x i s t ( " a d o b e   f u l l s c r e e n   c h e c k . a h k   -   A u t o H o t k e y " )  
 	 	 P o s t M e s s a g e   0 x 0 1 1 1 ,   6 5 3 0 3 , , ,   " a d o b e   f u l l s c r e e n   c h e c k . a h k   -   A u t o H o t k e y "  
 	 R e l o a d  
 	 S l e e p   1 0 0 0   ;   i f   s u c c e s s f u l ,   t h e   r e l o a d   w i l l   c l o s e   t h i s   i n s t a n c e   d u r i n g   t h e   S l e e p ,   s o   t h e   l i n e   b e l o w   w i l l   n e v e r   b e   r e a c h e d .  
 	 R e s u l t   : =   M s g B o x ( " T h e   s c r i p t   c o u l d   n o t   b e   r e l o a d e d .   W o u l d   y o u   l i k e   t o   o p e n   i t   f o r   e d i t i n g ? " , ,   4 )  
 	 	 i f   R e s u l t   =   " Y e s "  
 	 	 	 {  
 	 	 	 	 i f   W i n E x i s t ( " a h k _ e x e   C o d e . e x e " )  
 	 	 	 	 	 	 W i n A c t i v a t e  
 	 	 	 	 e l s e  
 	 	 	 	 	 R u n   " C : \ U s e r s \ "   A _ U s e r N a m e   " \ A p p D a t a \ L o c a l \ P r o g r a m s \ M i c r o s o f t   V S   C o d e \ C o d e . e x e "  
 	 	 	 }  
 }  
  
 ; s e t t i n g s H o t k e y ;  
 # F 1 : : s e t t i n g s G U I ( )   ; T h i s   h o t k e y   w i l l   p u l l   u p   t h e   h o t k e y   G U I  
  
 ; a c t i v e s c r i p t s H o t k e y ;  
 # F 2 : : a c t i v e S c r i p t s ( M y R e l e a s e )   ; T h i s   h o t k e y   p u l l s   u p   a   G U I   t h a t   g i v e s   i n f o r m a t i o n   r e g a r d i n g   a l l   c u r r e n t   a c t i v e   s c r i p t s ,   a s   w e l l   a s   o f f e r i n g   t h e   a b i l i t y   t o   c l o s e / o p e n   a n y   o f   t h e m   b y   s i m p l y   u n c h e c k i n g / c h e c k i n g   t h e   c o r r e s p o n d i n g   b o x  
  
 ; h a n d y h o t k e y s H o t k e y ;  
 # h : : h o t k e y s G U I ( )   ; t h i s   h o t k e y   p u l l s   u p   a   G U I   s h o w i n g   s o m e   u s e f u l   h o t k e y s   a t   y o u r   d i s p o s a l   w h i l e   u s i n g   t h e s e   s c r i p t s  
  
 ; s u s p e n d e r H o t k e y ;  
 # + ` : :   ; t h i s   h o t k e y   i s   t o   s u s p e n t   T H I S   s c r i p t .   T h i s   i s   h e l p f u l   w h e n   p l a y i n g   g a m e s   a s   t h i s   s c r i p t   w i l l   t r y   t o   f i r e   a n d   d o   w h a c k y   s t u f f   w h i l e   y o u ' r e   p l a y i n g   g a m e s  
 {  
 	 i f   A _ I s S u s p e n d e d   =   0  
 	 	 t o o l C u s t ( " y o u   s u s p e n d e d   h o t k e y s   f r o m   t h e   m a i n   s c r i p t " )  
 	 e l s e  
 	 	 t o o l C u s t ( " y o u   r e n a b l e d   h o t k e y s   f r o m   t h e   m a i n   s c r i p t " )  
 	 S u s p e n d ( - 1 )   ;   t o g g l e   s u s p e n d s   t h i s   s c r i p t .  
 }  
 # S u s p e n d E x e m p t   f a l s e  
  
 ; c e n t r e H o t k e y ;  
 # c : :   ; t h i s   h o t k e y   w i l l   c e n t e r   t h e   a c t i v e   w i n d o w   i n   t h e   m i d d l e   o f   t h e   a c t i v e   m o n i t o r  
 {   ; t h i s   s c r i p t s   m a t h   d o e s n ' t   r e a l l y   w o r k   f o r   v e r t i c a l   m o n i t o r s  
 	 m a i n M o n   : =   1   ; s e t   w h i c h   m o n i t o r   y o u r   m a i n   m o n i t o r   i s   ( u s u a l l y   1 ,   b u t   c a n   c h e c k   i n   w i n d o w s   d i s p l a y   s e t t i n g s )  
  
 	 / *  
 	   T h i s   f u n c t i o n   w i l l   d e t e r m i n e   w h i c h   m o n i t o r   t h e   c u r r e n t   a c t i v e   w i n d o w   i s   o n ,   t h e n   r e t u r n   s o m e   i n f o r m a t i o n   t o   h e l p   u s   d o   s o m e   m a t h   d o w n   b e l o w  
 	   * /  
 	 g e t M o n i t o r ( & m o n i t o r ,   & l e f t 2 ,   & r i g h t 2 ,   & t o p 2 ,   & b o t t o m 2 )  
 	 {  
 	 	 g e t T i t l e ( & t i t l e )  
 	 	 W i n G e t P o s ( & x ,   & y , , ,   t i t l e )  
 	 	 x   : =   x   +   1 0   ; s o m e t i m e s   w i n d o w s   w h e n   f u l l s c r e e n e d   w i l l   b e   a t   - 8 ,   - 8   a n d   n o t   0 ,   0  
 	 	 y   : =   y   +   1 0   ; s o   w e   j u s t   a d d   1 0   p i x e l s   t o   b o t h   v a r i a b l e s   t o   e n s u r e   w e ' r e   i n   t h e   c o r r e c t   m o n i t o r  
 	 	 n u m b e r o f M o n i t o r s   : =   S y s G e t ( 8 0 )  
 	 	 l o o p   n u m b e r o f M o n i t o r s   {  
 	 	 	 t r y   {  
 	 	 	 	 M o n i t o r G e t ( A _ I n d e x ,   & l e f t ,   & t o p ,   & r i g h t ,   & b o t t o m )  
 	 	 	 	 i f   x   >   l e f t   & &   x   <   r i g h t  
 	 	 	 	 	 {   ; t h e s e   t w o   i f   s t a t e m e n t s   d e t e r m i n e   w h a t   m o n i t o r   t h e   a c t i v e   w i n d o w   i s   i n  
 	 	 	 	 	 	 i f   y   <   b o t t o m   & &   y   >   t o p  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 ; M s g B o x ( x   "   "   y   " ` n "   l e f t   "   "   R i g h t   "   "   B o t t o m   "   "   T o p   " ` n w i t h i n   m o n i t o r   "   A _ I n d e x )   ; d e b u g g i n g  
 	 	 	 	 	 	 	 	 m o n i t o r   : =   A _ I n d e x  
 	 	 	 	 	 	 	 	 l e f t 2   : =   l e f t  
 	 	 	 	 	 	 	 	 r i g h t 2   : =   r i g h t  
 	 	 	 	 	 	 	 	 t o p 2   : =   t o p  
 	 	 	 	 	 	 	 	 b o t t o m 2   : =   b o t t o m  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 }  
 	 	 	 c a t c h   {  
 	 	 	 	 t o o l C u s t ( A _ T h i s F u n c   " ( )   f a i l e d   t o   g e t   t h e   m o n i t o r   t h a t   t h e   a c t i v e   w i n d o w   i s   i n " )  
 	 	 	 	 e r r o r L o g ( A _ T h i s F u n c   " ( ) " ,   " f a i l e d   t o   g e t   t h e   m o n i t o r   t h a t   t h e   a c t i v e   w i n d o w   i s   i n " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 b r e a k  
 	 	 	 }  
 	 	 }  
 	 }  
 	 s t a t i c   w i n   : =   " "   ; a   v a r i a b l e   w e ' l l   h o l d   t h e   t i t l e   o f   t h e   w i n d o w   i n  
 	 s t a t i c   t o g g l e   : =   1   ; a   v a r i a b l e   t o   d e t e r m i n e   w h e t h e r   t o   c e n t r e   o n   t h e   c u r r e n t   d i s p l a y   o r   m o v e   t o   t h e   m a i n   o n e  
 	 g e t M o n i t o r ( & m o n i t o r ,   & l e f t 2 ,   & r i g h t 2 ,   & t o p 2 ,   & b o t t o m 2 )   ; n o w   w e   r u n   t h e   a b o v e   f u n c t i o n   w e   c r e a t e d  
 	 i f   w i n   =   " "   ; i f   o u r   w i n   v a r i a b l e   d o e s n ' t   h a v e   a   t i t l e   y e t   w e   r u n   t h i s   c o d e   b l o c k  
 	 	 {  
 	 	 	 w i n   : =   t i t l e  
 	 	 	 t o g g l e   : =   1  
 	 	 }  
 	 i f   w i n   ! =   t i t l e   ; i f   o u r   w i n   v a r i a b l e   d o e s n ' t   e q u a l   t h e   a c t i v e   w i n d o w   w e   r u n   t h i s   c o d e   b l o c k   t o   r e s e t   o u r   v a l u e s  
 	 	 {  
 	 	 	 w i n   : =   t i t l e  
 	 	 	 t o g g l e   : =   1  
 	 	 }  
 	 s t a r t :  
 	 i f   t o g g l e   =   1   ; i f   i t ' s   t h e   f i r s t   a c t i v a t i o n   f o r   t h e   a c t i v e   w i n d o w   w e   r u n   t h i s   c o d e b l o c k  
 	 	 {  
 	 	 	 w i d t h   : =   r i g h t 2   -   l e f t 2   ; d e t e r m i n i n g   t h e   w i d t h   o f   t h e   c u r r e n t   m o n i t o r  
 	 	 	 h e i g h t   : =   b o t t o m 2   -   t o p 2   ; d e t e r m i n i n g   t h e   h e i g h t   o f   t h e   c u r r e n t   m o n i t o r  
 	 	 	 i s F u l l s c r e e n ( & t i t l e ,   & f u l l )   ; c h e c k i n g   i f   t h e   w i n d o w   i s   f u l l s c r e e n  
 	 	 	 i f   f u l l   =   1  
 	 	 	 	 W i n R e s t o r e ( t i t l e )   ; w i n r e s t o r e   w i l l   u n m a x i m i s e   i t  
 	 	  
 	 	 	 n e w W i d t h   : =   w i d t h   /   1 . 6   ; d e t e r m i n i n g   o u r   n e w   w i d t h  
 	 	 	 n e w H e i g h t   : =   h e i g h t   /   1 . 6   ; d e t e r m i n i n g   o u r   n e w   h e i g h t  
 	 	 	 n e w X   : =   ( l e f t 2   +   ( w i d t h   -   n e w W i d t h ) / 2 )   ; u s i n g   m a t h   t o   c e n t r e   o u r   n e w l y   c r e a t e d   w i n d o w  
 	 	 	 n e w Y   : =   ( b o t t o m 2   -   ( h e i g h t   +   n e w H e i g h t ) / 2 )   ; u s i n g   m a t h   t o   c e n t r e   o u r   n e w l y   c r e a t e d   w i n d o w  
 	 	 	 ; M s g B o x ( " m o n i t o r   =   "   m o n i t o r   " ` n w i d t h   =   "   w i d t h   " ` n h e i g h t   =   "   h e i g h t   " ` n n e w W i d t h   =   "   n e w W i d t h   " ` n n e w H e i g h t   =   "   n e w H e i g h t   " ` n n e w X   =   "   n e w X   " ` n n e w Y   =   "   n e w Y   " ` n x   =   "   x 2   " ` n y   =   "   y 2   " ` n l e f t   =   "   l e f t 2   " ` n r i g h t   =   "   r i g h t 2   " ` n t o p   =   "   t o p 2   " ` n b o t t o m   =   "   b o t t o m 2 )   ; d e b u g g i n g  
 	 	 	 i f   m o n i t o r   ! =   m a i n M o n   ; i f   t h e   c u r r e n t   m o n i t o r   i s n ' t   o u r   m a i n   m o n i t o r   w e   w i l l   i n c r e m e n t   t h e   t o g g l e   v a r i a b l e  
 	 	 	 	 t o g g l e   + =   1  
 	 	 	 e l s e   ; o t h e r w i s e   w e   r e s e t   t h e   w i n   v a r i a b l e  
 	 	 	 	 w i n   : =   " "  
 	 	 }  
 	 e l s e   i f   t o g g l e   =   2   ; i f   t h i s   i s   t h e   s e c o n d   a c t i v a t i o n   f o r   t h e   a c t i v e   w i n d o w   w e   r u n   t h i s   c o d e b l o c k  
 	 	 {  
 	 	 	 M o n i t o r G e t ( m a i n M o n ,   & l e f t 2 ,   & t o p 2 ,   & r i g h t 2 ,   & b o t t o m 2 )   ; t h i s   w i l l   r e s e t   o u r   v a r i a b l e s   w i t h   i n f o r m a t i o n   f o r   t h e   m a i n   m o n i t o r  
 	 	 	 m o n i t o r   : =   m a i n M o n   ; t h e n   w e   s e t   t h e   m o n i t o r   v a l u e   t o   t h e   m a i n   m o n i t o r  
 	 	 	 t o g g l e   : =   1   ; r e s e t   o u r   t o g g l e  
 	 	 	 w i n   : =   " "   ; r e s e t   o u r   w i n   v a r i a b l e  
 	 	 	 g o t o   s t a r t   ; a n d   g o   b a c k   t o   t h e   b e g i n n i n g  
 	 	 }  
 	 i f   I n S t r ( t i t l e ,   " Y o u T u b e " )   & &   I s S e t ( n e w H e i g h t )   & &   m o n i t o r   =   m a i n M o n   ; M y   m a i n   m o n i t o r   i s   1 4 4 0 p   s o   I   w a n t   m y   y o u t u b e   w i n d o w   t o   b e   a   l i t t l e   b i g g e r   i f   I   c e n t r e   i t  
 	 	 {  
 	 	 	 n e w H e i g h t   : =   n e w H e i g h t   *   1 . 3  
 	 	 	 n e w Y   : =   n e w Y   /   2 . 2 5  
 	 	 }  
 	 t r y {  
 	 	 W i n M o v e ( n e w X ,   n e w Y ,   n e w W i d t h ,   n e w H e i g h t ,   t i t l e )   ; t h e n   w e   a t t e m p t   t o   m o v e   t h e   w i n d o w  
 	 	 ; t o o l C u s t ( " W i n d o w :   "   w i n   " ` n T o g g l e :   "   t o g g l e )   ; f o r   w h a t e v e r   r e a s o n ,   p r o d u c i n g   a   t o o l t i p   a c t u a l l y   b r e a k s   f u n c t i o n a l i t y . . . .   h u h ? ?  
 	 }  
 }  
  
 ; f u l l s c r e e n H o t k e y ;  
 # f : :   ; t h i s   h o t k e y   w i l l   f u l l s c r e e n   t h e   a c t i v e   w i n d o w   i f   i t   i s n ' t   a l r e a d y .   I f   i t   i s   a l r e a d y   f u l l s c r e e n e d ,   i t   w i l l   p u l l   i t   o u t   o f   f u l l s c r e e n  
 {  
 	 i s F u l l s c r e e n ( & t i t l e ,   & f u l l )  
 	 i f   f u l l   =   0  
 	 	 W i n M a x i m i z e ( t i t l e )   ; w i n r e s t o r e   w i l l   u n m a x i m i s e   i t  
 	 e l s e  
 	 	 W i n R e s t o r e ( t i t l e )  
 }  
  
 ; j u m p 1 0 c h a r H o t k e y ;  
 S C 0 3 A   &   L e f t : : j u m p C h a r ( )  
 S C 0 3 A   &   R i g h t : : j u m p C h a r ( )  
  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ;  
 ; 	 	 l a u n c h   p r o g r a m s  
 ;  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 # H o t I f   n o t   G e t K e y S t a t e ( " F 2 4 " ,   " P " )   ; i m p o r t a n t   s o   c e r t a i n   t h i n g s   d o n ' t   t r y   a n d   o v e r r i d e   m y   s e c o n d   k e y b o a r d  
 ; w i n d o w s p y H o t k e y ;  
 P a u s e : : s w i t c h T o W i n d o w S p y ( )   ; r u n / s w a p   t o   w i n d o w s p y  
 ; v s c o d e H o t k e y ;  
 R W i n : : s w i t c h T o V S C ( )   ; r u n / s w a p   t o   v s c o d e  
 ; s t r e a m d e c k H o t k e y ;  
 S c r o l l L o c k : : s w i t c h T o S t r e a m d e c k ( )   ; r u n / s w a p   t o   t h e   s t r e a m d e c k   p r o g r a m  
 ; t a s k m a n g e r H o t k e y ;  
 P r i n t S c r e e n : : S e n d I n p u t ( " ^ + { E s c } " )   ; o p e n   t a s k m a n a g e r  
 ; e x c e l H o t k e y ;  
 P g U p : : s w i t c h T o E x c e l ( )   ; r u n / s w a p   t o   e x c e l  
  
 ; T h e s e   t w o   s c r i p t s   a r e   t o   o p e n   h i g h l i g h t e d   t e x t   i n   t h e   a h k   d o c u m e n t a t i o n  
 ; a k h d o c u H o t k e y ;  
 A p p s K e y : :   R u n ( " h t t p s : / / l e x i k o s . g i t h u b . i o / v 2 / d o c s / A u t o H o t k e y . h t m " )   ; o p e n s   a h k   d o c u m e n t a t i o n  
 ; a h k s e a r c h H o t k e y ;  
 ^ A p p s K e y : :   ; o p e n s   h i g h l i g h t e d   a h k   c o m m a n d   i n   t h e   d o c u m e n t a t i o n  
 {  
 	 p r e v i o u s   : =   A _ C l i p b o a r d  
 	 A _ C l i p b o a r d   : =   " "   ; c l e a r s   t h e   c l i p b o a r d  
 	 S e n d ( " ^ c " )  
 	 i f   ! C l i p W a i t ( 1 )   ; w a i t s   f o r   t h e   c l i p b o a r d   t o   c o n t a i n   d a t a  
 	 	 {  
 	 	 	 t o o l C u s t ( " C o u l d n ' t   c o p y   d a t a   t o   c l i p b o a r d " )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " c o u l d n ' t   c o p y   d a t a   t o   c l i p b o a r d " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 	 R u n ( " h t t p s : / / l e x i k o s . g i t h u b . i o / v 2 / d o c s / c o m m a n d s / "   A _ C l i p b o a r d   " . h t m " )  
 	 A _ C l i p b o a r d   : =   p r e v i o u s  
 }  
 ; s t r e a m f o o b a r H o t k e y ;  
 ^ F 2 2 : :   ; o p e n s   f o o b a r ,   e n s u r e s   t h e   r i g h t   p l a y l i s t   i s   s e l e c t e d ,   t h e n   m a k e s   i t   s e l e c t   a   s o n g   a t   r a n d o m .   T h i s   i s   f o r   m y   s t r e a m .  
 {  
 	 R u n ( " C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ f o o b a r 2 0 0 0 \ f o o b a r 2 0 0 0 . e x e " )   ; I   c a n ' t   u s e   v l c   b e c a u s e   t h e   m i i   w i i   t h e m e s   c u r r e n t l y   u s e   t h a t   s o   h a   h a   h e r e   w e   g o o o o o o o o  
 	 W i n W a i t ( " a h k _ e x e   f o o b a r 2 0 0 0 . e x e " )  
 	 i f   W i n E x i s t ( " a h k _ e x e   f o o b a r 2 0 0 0 . e x e " )  
 	 	 W i n A c t i v a t e  
 	 s l e e p   1 0 0 0  
 	 W i n G e t P o s ( , ,   & w i d t h ,   & h e i g h t ,   " A " )  
 	 M o u s e G e t P o s ( & x ,   & y )  
 	 i f   I m a g e S e a r c h ( & x d i r ,   & y d i r ,   0 ,   0 ,   w i d t h ,   h e i g h t ,   " * 2   "   A _ W o r k i n g D i r   " \ S u p p o r t   F i l e s \ I m a g e S e a r c h \ F o o b a r \ p o k e m o n . p n g " )  
 	 	 {  
 	 	 	 M o u s e M o v e ( x d i r ,   y d i r )  
 	 	 	 S e n d I n p u t ( " { C l i c k } " )  
 	 	 }  
 	 S e n d I n p u t ( " ! p "   " a " )  
 	 M o u s e M o v e ( x ,   y )  
 }  
  
 ; m o v e   m o u s e   a l o n g   o n e   a x i s  
 S C 0 3 A   &   X B u t t o n 2 : : m o v e X o r Y ( )  
 S C 0 3 A   &   X B u t t o n 1 : : m o v e X o r Y ( )  
  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ;  
 ; 	 	 o t h e r  
 ;  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 # H o t I f   W i n A c t i v e ( " a h k _ c l a s s   C a b i n e t W C l a s s " )   | |   W i n A c t i v e ( " a h k _ c l a s s   # 3 2 7 7 0 " )   ; w i n d o w s   e x p l o r e r  
 ; e x p l o r e r b a c k H o t k e y ;  
 F 2 1 : : S e n d I n p u t ( " ! { U p } " )   ; M o v e s   b a c k   1   f o l d e r   i n   t h e   t r e e   i n   e x p l o r e r  
 ; s h o w m o r e H o t k e y ;  
 F 1 4 : :   ; o p e n   t h e   " s h o w   m o r e   o p t i o n s "   m e n u   i n   w i n 1 1  
 {  
 	 ; K e e p   i n   m i n d   I   u s e   d a r k   m o d e   o n   w i n 1 1 .   T h i n g s   w i l l   b e   d i f f e r e n t   i n   l i g h t   m o d e / o t h e r   v e r s i o n s   o f   w i n d o w s  
 	 M o u s e G e t P o s ( & m x ,   & m y )  
 	 W i n G e t P o s ( , ,   & w i d t h ,   & h e i g h t ,   " A " )  
 	 c o l o u r 1   : =   0 x 4 D 4 D 4 D   ; w h e n   h o v e r i n g   a   f o l d e r  
 	 c o l o u r 2   : =   0 x F F D A 7 0  
 	 c o l o u r 3   : =   0 x 3 5 3 5 3 5   ; w h e n   a l r e a d y   c l i c k e d   o n  
 	 c o l o u r 4   : =   0 x 7 7 7 7 7 7   ; w h e n   a l r e a d y   c l i c k e d   o n  
 	 c o l o u r   : =   P i x e l G e t C o l o r ( m x ,   m y )  
 	 i f   G e t K e y S t a t e ( " L B u t t o n " ,   " P " )   ; t h i s   i s   h e r e   s o   t h a t   m o v e W i n ( )   c a n   f u n c t i o n   w i t h i n   w i n d o w s   E x p l o r e r .   I t   i s   o n l y   n e c e s s a r y   b e c a u s e   I   u s e   t h e   s a m e   b u t t o n   f o r   b o t h   s c r i p t s .  
 	 	 {  
 	 	 	 S e n d I n p u t ( " { L B u t t o n   U p } " )  
 	 	 	 W i n M a x i m i z e  
 	 	 	 r e t u r n  
 	 	 }  
 	 e l s e   i f   I m a g e S e a r c h ( & x ,   & y ,   0 ,   0 ,   w i d t h ,   h e i g h t ,   " * 5   "   E x p l o r e r   " s h o w m o r e . p n g " )  
 	 	 {  
 	 	 	 ; t o o l C u s t ( c o l o u r   " ` n   i m a g e s e a r c h   f i r e d " )   ; f o r   d e b u g g i n g  
 	 	 	 ; S e n d I n p u t ( " { E s c } " )  
 	 	 	 ; S e n d I n p u t ( " { C l i c k } " )  
 	 	 	 i f   c o l o u r   =   c o l o u r 1   | |   c o l o u r   =   c o l o u r 2  
 	 	 	 	 {  
 	 	 	 	 	 ; S e n d I n p u t ( " { C l i c k } " )  
 	 	 	 	 	 S e n d I n p u t ( " { E s c   3 } "   " + { F 1 0 } " )  
 	 	 	 	 }  
 	 	 	 e l s e  
 	 	 	 	 S e n d I n p u t ( " { E s c } "   " + { F 1 0 } "   " + { F 1 0 } " )  
 	 	 	 r e t u r n  
 	 	 }  
 	 e l s e   i f   ( c o l o u r   =   c o l o u r 1   | |   c o l o u r   =   c o l o u r 2 )  
 	 	 {  
 	 	 	 ; t o o l C u s t ( c o l o u r   " ` n   c o l o u r 1 & 2   f i r e d " )   ; f o r   d e b u g g i n g  
 	 	 	 S e n d I n p u t ( " { C l i c k } " )  
 	 	 	 S e n d I n p u t ( " { E s c } "   " + { F 1 0 } " )  
 	 	 	 r e t u r n  
 	 	 }  
 	 e l s e   i f   ( c o l o u r   =   c o l o u r 3   | |   c o l o u r   =   c o l o u r 4 )  
 	 	 {  
 	 	 	 ; t o o l C u s t ( c o l o u r   " ` n   c o l o u r 3 & 4   f i r e d " )   ; f o r   d e b u g g i n g  
 	 	 	 S e n d I n p u t ( " { E s c } "   " + { F 1 0 } " )  
 	 	 	 r e t u r n  
 	 	 }  
 	 e l s e  
 	 	 {  
 	 	 	 ; t o o l C u s t ( c o l o u r   " ` n   f i n a l   e l s e   f i r e d " )   ; f o r   d e b u g g i n g  
 	 	 	 S e n d I n p u t ( " { E s c } "   " + { F 1 0 } " )  
 	 	 	 r e t u r n  
 	 	 }  
 }  
  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   C o d e . e x e " )  
 ; v s c o d e m s H o t k e y ;  
 ! a : : v s c o d e ( " 5 8 0 " )   ; c l i c k s   o n   t h e   ` m y   s c r i p t s `   s c r i p t   i n   v s c o d e  
 ; v s c o d e f u n c H o t k e y ;  
 ! f : : v s c o d e ( " 6 0 0 " )   ; c l i c k s   o n   m y   ` f u n c t i o n s `   s c r i p t   i n   v s c o d e  
 ; v s c o d e q m k H o t k e y ;  
 ! q : : v s c o d e ( " 6 2 0 " )   ; c l i c k s   o n   m y   ` q m k `   s c r i p t   i n   v s c o d e  
 ; v s c o d e c h a n g e H o t k e y ;  
 ! c : : v s c o d e ( " 4 8 0 " )   ; c l i c k s   o n   m y   ` c h a n g e l o g `   f i l e   i n   v s c o d e  
  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   f i r e f o x . e x e " )  
 ; p a u s e y o u t u b e H o t k e y ;  
 M e d i a _ P l a y _ P a u s e : :   ; p a u s e s   y o u t u b e   v i d e o   i f   t h e r e   i s   o n e .  
 {  
 	 c o o r d s ( )  
 	 M o u s e G e t P o s ( & x ,   & y )  
 	 c o o r d w ( )  
 	 S e t T i t l e M a t c h M o d e   2  
 	 n e e d l e   : =   " Y o u T u b e "  
 	 g e t T i t l e ( & t i t l e )  
 	 i f   ( I n S t r ( t i t l e ,   n e e d l e ) )  
 	 	 {  
 	 	 	 i f   I n S t r ( t i t l e ,   " S u b s c r i p t i o n s   -   Y o u T u b e      M o z i l l a   F i r e f o x " ,   1 )   | |   t i t l e   =   " Y o u T u b e      M o z i l l a   F i r e f o x "  
 	 	 	 	 {  
 	 	 	 	 	 S e n d I n p u t ( " { M e d i a _ P l a y _ P a u s e } " )  
 	 	 	 	 	 r e t u r n  
 	 	 	 	 }  
 	 	 	 S e n d I n p u t ( " { S p a c e } " )  
 	 	 	 r e t u r n  
 	 	 }  
 	 e l s e   l o o p   {  
 	 	 W i n G e t P o s ( , ,   & w i d t h , ,   " A " )  
 	 	 i f   I m a g e S e a r c h ( & x p o s ,   & y p o s ,   0 ,   0 ,   w i d t h ,   " 6 0 " ,   " * 2   "   f i r e f o x   " y o u t u b e 1 . p n g " )   | |   I m a g e S e a r c h ( & x p o s ,   & y p o s ,   0 ,   0 ,   w i d t h ,   " 6 0 " ,   " * 2   "   f i r e f o x   " y o u t u b e 2 . p n g " )  
 	 	 	 {  
 	 	 	 	 M o u s e M o v e ( x p o s ,   y p o s ,   2 )   ; 2   s p e e d   i s   o n l y   n e c e s s a r y   b e c a u s e   o f   m y   m u l t i p l e   m o n i t o r s   -   i f   I   s t a r t   m y   m o u s e   i n   a   c e r t a i n   p o s i t i o n ,   i t ' l l   g e t   s t u c k   o n   t h e   c o r n e r   o f   m y   m a i n   m o n i t o r   a n d   c l o s e   t h e   f i r e f o x   t a b  
 	 	 	 	 S e n d I n p u t ( " { C l i c k } " )  
 	 	 	 	 c o o r d s ( )  
 	 	 	 	 M o u s e M o v e ( x ,   y ,   2 )  
 	 	 	 	 b r e a k  
 	 	 	 }  
 	 	 e l s e  
 	 	 	 s w i t c h T o O t h e r F i r e f o x W i n d o w ( )  
 	 	 i f   A _ I n d e x   >   5  
 	 	 	 {  
 	 	 	 	 t o o l C u s t ( " C o u l d n ' t   f i n d   a   y o u t u b e   t a b " )  
 	 	 	 	 t r y   {  
 	 	 	 	 	 W i n A c t i v a t e ( t i t l e )   ; r e a c t i v a t e s   t h e   o r i g i n a l   w i n d o w  
 	 	 	 	 }   c a t c h   a s   e   {  
 	 	 	 	 	 t o o l C u s t ( " F a i l e d   t o   g e t   i n f o r m a t i o n   o n   l a s t   a c t i v e   w i n d o w " )  
 	 	 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " F a i l e d   t o   g e t   i n f o r m a t i o n   o n   l a s t   a c t i v e   w i n d o w " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 }  
 	 	 	 	 S e n d I n p u t ( " { M e d i a _ P l a y _ P a u s e } " )   ; i f   i t   c a n ' t   f i n d   a   y o u t u b e   w i n d o w   i t   w i l l   s i m p l y   s e n d   t h r o u g h   a   r e g u l a r   p l a y   p a u s e   i n p u t  
 	 	 	 	 r e t u r n  
 	 	 	 }  
 	 }  
 	 S e n d I n p u t ( " { S p a c e } " )  
 }  
  
 ; t h e   b e l o w   d i s a b l e s   t h e   n u m p a d   o n   y o u t u b e   s o   y o u   d o n ' t   a c c i d e n t a l l y   s k i p   a r o u n d   a   v i d e o  
 N u m p a d 0 : :  
 N u m p a d 1 : :  
 N u m p a d 2 : :  
 N u m p a d 3 : :  
 N u m p a d 4 : :  
 N u m p a d 5 : :  
 N u m p a d 6 : :  
 N u m p a d 7 : :  
 N u m p a d 8 : :  
 N u m p a d 9 : :  
 {  
 	 S e t T i t l e M a t c h M o d e   2  
 	 n e e d l e   : =   " Y o u T u b e "  
 	 g e t T i t l e ( & t i t l e )  
 	 i f   ( I n S t r ( t i t l e ,   n e e d l e ) )  
 	 	 r e t u r n  
 	 e l s e  
 	 	 S e n d I n p u t ( " { "   A _ T h i s H o t k e y   " } " )  
 }  
  
 ; p i n f i r e f o x H o t k e y ;  
 R A l t   &   p : :   ; T h i s   h o t k e y   i s   t o   p i n   t h e   f i r s t   t w o   t a b s  
 {  
 	 K e y W a i t ( " A l t " )  
 	 S e n d ( " ! d " )   ; o p e n s   t h e   a l t   c o n t e x t   m e n u   t o   b e g i n   d e t a t c h i n g   t h e   f i r e f o x   t a b  
 	 s l e e p   1 0 0  
 	 S e n d ( " + { T A B   3 } " )  
 	 s l e e p   5 0  
 	 S e n d ( " + { F 1 0 } " )  
 	 s l e e p   5 0  
 	 S e n d ( " p " )  
 	 s l e e p   5 0  
 	 S e n d ( " { R i g h t } " )  
 	 S e n d ( " + { F 1 0 } "   " p "   " { L e f t } " )  
 }  
  
 ; m o v e t a b H o t k e y ;  
 X B u t t o n 2 : :   ; t h e s e   t w o   h o t k e y s   a r e   a c t i v a t e d   b y   r i g h t   c l i c k i n g   o n   a   t a b   t h e n   p r e s s i n g   e i t h e r   o f   t h e   t w o   s i d e   m o u s e   b u t t o n s  
 X B u t t o n 1 : : m o v e T a b ( )  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 D i s c o r d  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   D i s c o r d . e x e " )   ; s o m e   s c r i p t s   t o   s p e e d   u p   d i s c o r d   i n t e r a c t i o n s  
 ; S C O 3 A   i s   t h e   s c a n c o d e   f o r   t h e   C a p s L o c k   b u t t o n .   H a d   i s s u e s   w i t h   u s i n g   " C a p s L o c k "   a s   i t   w o u l d   r e q u i r e   a   r e f r e s h   e v e r y   n o w   a n d   t h e n   b e f o r e   t h e s e   d i s c o r d   s c r i p t s   w o u l d   w o r k .   C u r r e n t l y   t e s t i n g   u s i n g   t h e   s c a n c o d e s   t o   s e e   i f   t h a t   f i x e s   i t .  
 ; a l r i g h t   s c a n c o d e s   d i d n ' t   f i x   i t ,   i d k   w h y   b u t   s o m e t i m e s   t h i s   f u n c t i o n   w o n ' t   w o r k   u n t i l   y o u   r e f r e s h   t h e   m a i n   s c r i p t .   M i g h t   h a v e   t o   d o   w i t h   w h e r e   I   h a v e   i t   l o c a t e d   i n   t h i s   s c r i p t ,   m a y b e   p u l l i n g   i t   o u t   i n t o   i t ' s   o w n   s c r i p t   w o u l d   f i x   i t ,   o r   m a y b e   d i s c o r d   i s   j u s t   d u m b ,   w h o   k n o w s .  
 ; s c r a t c h   t h a t ,   f i g u r e d   o u t   w h a t   i t   i s ,   i n   m y   q m k   k e y b o a r d   s c r i p t   I   a l s o   h a d   s e t c a p s l o c k   t o   o f f   a n d   f o r   w h a t e v e r   r e a s o n   i f   t h a t   s c r i p t   w a s   r e l o a d e d ,   m y   m a i n   s c r i p t   w o u l d   b r e a k  
 ; d i s c e d i t H o t k e y ;  
 S C 0 3 A   &   e : : d i s c ( " D i s c E d i t . p n g " )   ; e d i t   t h e   m e s s a g e   y o u ' r e   h o v e r i n g   o v e r  
 ; d i s c r e p l y H o t k e y ;  
 S C 0 3 A   &   r : : d i s c ( " D i s c R e p l y . p n g " )   ; r e p l y   t o   t h e   m e s s a g e   y o u ' r e   h o v e r i n g   o v e r   ; t h i s   r e p l y   h o t k e y   h a s   s p e c i f i c   c o d e   j u s t   f o r   i t   w i t h i n   t h e   f u n c t i o n .   T h i s   a c t i v a t i o n   h o t k e y   n e e d s   t o   b e   d e f i n e d   i n   K e y b o a r d   S h o r t c u t s . i n i   i n   t h e   [ H o t k e y s ]   s e c t i o n  
 ; d i s c r e a c t H o t k e y ;  
 S C 0 3 A   &   a : : d i s c ( " D i s c R e a c t . p n g " )   ; a d d   a   r e a c t i o n   t o   t h e   m e s s a g e   y o u ' r e   h o v e r i n g   o v e r  
 ; d i s c d e l e t e H o t k e y ;  
 S C 0 3 A   &   d : : d i s c ( " D i s c D e l e t e . p n g " )   ; d e l e t e   t h e   m e s s a g e   y o u ' r e   h o v e r i n g   o v e r .   A l s o   h o l d   s h i f t   t o   s k i p   t h e   p r o m p t  
 ^ + t : : R u n ( A _ W o r k i n g D i r   " \ S u p p o r t   F i l e s \ s h o r t c u t s \ D i s c o r d T i m e S t a m p e r . e x e . l n k " )   ; o p e n s   d i s c o r d   t i m e s t a m p   p r o g r a m   [ h t t p s : / / g i t h u b . c o m / T i m e T r a v e l P e n g u i n / D i s c o r d T i m e S t a m p e r ]  
  
 ; d i s c S e r v H o t k e y ;  
 F 1 : : d i s c U n r e a d ( )   ; w i l l   c l i c k   a n y   u n r e a d   s e r v e r s  
 ; d i s c M s g H o t k e y ;  
 F 2 : : d i s c U n r e a d ( 2 )   ; w i l l   c l i c k   a n y   u n r e a d   c h a n n e l s  
 ; d i s c D M H o t k e y ;  
 F 3 : :   ; t h i s   h o t k e y   i s   t o   c l i c k   t h e   " d i s c o r d "   b u t t o n   i n   d i s c o r d   t o   a c c e s s   y o u r   d m ' s  
 {  
 	 W i n A c t i v a t e ( " a h k _ e x e   D i s c o r d . e x e " )  
 	 b l o c k O n ( )  
 	 M o u s e G e t P o s ( & o r i g x ,   & o r i g y )  
 	 M o u s e M o v e ( 3 4 ,   5 2 ,   2 )  
 	 S e n d I n p u t ( " { C l i c k } " )  
 	 M o u s e M o v e ( o r i g x ,   o r i g y ,   2 )  
 	 b l o c k O f f ( )  
 }  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 P h o t o s h o p  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   P h o t o s h o p . e x e " )  
 ; p n g H o t k e y ;  
 ^ + p : : p s T y p e ( " p n g " )   ; W h e n   s a v i n g   a   f i l e   a n d   h i g h l i g h t i n g   t h e   n a m e   o f   t h e   d o c u m e n t ,   t h i s   m o v e s   t h r o u g h   a n d   s e l e c t s   t h e   o u t p u t   f i l e   a s   a   p n g   i n s t e a d   o f   t h e   d e f a u l t   p s d  
 ; j p g H o t k e y ;  
 ^ + j : : p s T y p e ( " j p g " )   ; W h e n   s a v i n g   a   f i l e   a n d   h i g h l i g h t i n g   t h e   n a m e   o f   t h e   d o c u m e n t ,   t h i s   m o v e s   t h r o u g h   a n d   s e l e c t s   t h e   o u t p u t   f i l e   a s   a   j p g   i n s t e a d   o f   t h e   d e f a u l t   p s d  
  
 ; p h o t o p e n H o t k e y ;  
 X B u t t o n 1 : : m o u s e d r a g N o t P r e m ( h a n d T o o l ,   p e n T o o l )   ; c h a n g e s   t h e   t o o l   t o   t h e   h a n d   t o o l   w h i l e   m o u s e   b u t t o n   i s   h e l d   ; c h e c k   t h e   v a r i o u s   F u n c t i o n s   s c r i p t s   f o r   t h e   c o d e   t o   t h i s   p r e s e t   &   t h e   k e y b o a r d   s h o r t c u t   i n i   f i l e   t o   a d j u s t   h o t k e y s  
 ; p h o t o s e l e c t H o t k e y ;  
 X b u t t o n 2 : : m o u s e d r a g N o t P r e m ( h a n d T o o l ,   s e l e c t i o n T o o l )   ; c h a n g e s   t h e   t o o l   t o   t h e   h a n d   t o o l   w h i l e   m o u s e   b u t t o n   i s   h e l d   ; c h e c k   t h e   v a r i o u s   F u n c t i o n s   s c r i p t s   f o r   t h e   c o d e   t o   t h i s   p r e s e t   &   t h e   k e y b o a r d   s h o r t c u t   i n i   f i l e   t o   a d j u s t   h o t k e y s  
 ; p h o t o z o o m H o t k e y ;  
 z : : m o u s e d r a g N o t P r e m ( z o o m T o o l ,   s e l e c t i o n T o o l )   ; c h a n g e s   t h e   t o o l   t o   t h e   z o o m   t o o l   w h i l e   z   b u t t o n   i s   h e l d   ; c h e c k   t h e   v a r i o u s   F u n c t i o n s   s c r i p t s   f o r   t h e   c o d e   t o   t h i s   p r e s e t   &   t h e   k e y b o a r d   s h o r t c u t   i n i   f i l e   t o   a d j u s t   h o t k e y s  
 ; F 1 : : p s S a v e ( )  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 A f t e r   E f f e c t s  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   A f t e r F X . e x e " )  
 ; a e t i m e l i n e H o t k e y ;  
 X b u t t o n 1 : : a e t i m e l i n e ( )   ; c h e c k   t h e   v a r i o u s   F u n c t i o n s   s c r i p t s   f o r   t h e   c o d e   t o   t h i s   p r e s e t   &   t h e   k e y b o a r d   i n i   f i l e   f o r   k e y b o a r d   s h o r t c u t s  
 ; a e s e l e c t i o n H o t k e y ;  
 X b u t t o n 2 : : m o u s e d r a g N o t P r e m ( h a n d A E ,   s e l e c t i o n A E )   ; c h a n g e s   t h e   t o o l   t o   t h e   h a n d   t o o l   w h i l e   m o u s e   b u t t o n   i s   h e l d   ; c h e c k   t h e   v a r i o u s   F u n c t i o n s   s c r i p t s   f o r   t h e   c o d e   t o   t h i s   p r e s e t   &   t h e   k e y b o a r d   i n i   f i l e   f o r   k e y b o a r d   s h o r t c u t s  
 ; a e p r e v i o u s f r a m e H o t k e y ;  
 F 2 1 : : S e n d I n p u t ( p r e v i o u s K e y f r a m e )   ; c h e c k   t h e   k e y b o a r d   s h o r t c u t   i n i   f i l e   t o   a d j u s t   h o t k e y s  
 ; a e n e x t f r a m e H o t k e y ;  
 F 2 3 : : S e n d I n p u t ( n e x t K e y f r a m e )   ; c h e c k   t h e   k e y b o a r d   s h o r t c u t   i n i   f i l e   t o   a d j u s t   h o t k e y s  
  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 ;  
 ; 	 	 P r e m i e r e  
 ;  
 ; = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 # H o t I f   W i n A c t i v e ( " a h k _ e x e   A d o b e   P r e m i e r e   P r o . e x e " )  
 ; T h e r e   u s e   t o   b e   a   l o t   o f   m a c r o s   a b o u t   h e r e   i n   t h e   s c r i p t ,   t h e y   h a v e   s i n c e   b e e n   r e m o v e d   a n d   m o v e d   t o   t h e i r   o w n   i n d i v i d u a l   . a h k   f i l e s   a s   l a u n c h i n g   t h e m   d i r e c t l y  
 ; v i a   a   s t r e a m d e c k   i s   f a r   m o r e   e f f e c i e n t ;   1 .   b e c a u s e   I   o n l y   e v e r   l a u n c h   t h e m   v i a   t h e   s t r e a m d e c k   a n y w a y   &   2 .   b e c a u s e   t h a t   n o   l o n g e r   r e q u i r e s   m e   t o   e a t   u p   a   h o t k e y  
 ; t h a t   I   c o u l d   u s e   e l s e w h e r e ,   t o   r u n   t h e m .   T h e s e   m e n t i o n e d   s c r i p t s   c a n   b e   f o u n d   i n   t h e   \ S t r e a m d e c k   A H K \   f o l d e r .  
  
 ; p r e m z o o m o u t H o t k e y ;  
 S C 0 3 A   &   z : : S e n d I n p u t ( z o o m O u t )   ; \ \ s e t   z o o m   o u t   i n   t h e   k e y b o a r d   s h o r t c u t s   i n i   ; i d k   w h y   t f   I   n e e d   t h e   s c a n c o d e   f o r   c a p s l o c k   h e r e   b u t   I   b l a m e   p r e m i e r e  
 ; p r e m s e l e c t t o o l H o t k e y ;  
 S C 0 3 A   &   v : :   ; g e t t i n g   b a c k   t o   t h e   s e l e c t i o n   t o o l   w h i l e   y o u ' r e   e d i t i n g   t e x t   w i l l   u s u a l l y   j u s t   i n p u t   a   v   p r e s s   i n s t e a d   s o   t h i s   s c r i p t   w a r p s   t o   t h e   s e l e c t i o n   t o o l   o n   y o u r   h o t b a r   a n d   p r e s s e s   i t  
 {  
 	 M o u s e G e t P o s ( & x p o s ,   & y p o s )  
 	 S e n d I n p u t ( t o o l s W i n d o w )  
 	 S e n d I n p u t ( t o o l s W i n d o w )  
 	 s l e e p   5 0  
 	 t r y   {  
                 t o o l s C l a s s N N   : =   C o n t r o l G e t C l a s s N N ( C o n t r o l G e t F o c u s ( " A " ) )  
 	 	 C o n t r o l G e t P o s ( & t o o l x ,   & t o o l y ,   & w i d t h ,   & h e i g h t ,   t o o l s C l a s s N N )  
         }   c a t c h   a s   e   {  
                 t o o l C u s t ( " C o u l d n ' t   f i n d   t h e   C l a s s N N   v a l u e " )  
                 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   C l a s s N N   v a l u e " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
         }  
 	 ; M o u s e M o v e   3 4 ,   9 1 7   ; l o c a t i o n   o f   t h e   s e l e c t i o n   t o o l  
 	 i f   w i d t h   =   0   | |   h e i g h t   =   0  
 	 	 {  
 	 	 	 l o o p   {  
 	 	 	 	 ; f o r   w h a t e v e r   r e a s o n ,   i f   y o u ' r e   c l i c k e d   o n   a n o t h e r   p a n e l ,   t h e n   t r y   t o   h i t   t h i s   h o t k e y ,   ` C o n t r o l G e t P o s `   r e f u s e s   t o   a c t u a l l y   g e t   a n y   v a l u e ,   I   h a v e   n o   i d e a   w h y .   T h i s   l o o p   w i l l   a t t e m p t   t o   g e t   t h a t   i n f o r m a t i o n   a n y w a y ,   b u t   i f   i t   f a i l s   w i l l   f a l l b a c k   t o   t h e   h o t k e y   y o u   h a v e   s e t   w i t h i n   p r e m i e r e  
 	 	 	 	 ; t o o l C u s t ( A _ I n d e x   " ` n "   w i d t h   " ` n "   h e i g h t ,   " 1 0 0 " )  
 	 	 	 	 i f   w i d t h   ! =   0   | |   h e i g h t   ! =   0  
 	 	 	 	 	 b r e a k  
 	 	 	 	 i f   A _ I n d e x   >   3  
 	 	 	 	 	 {  
 	 	 	 	 	 	 S e n d I n p u t ( s e l e c t i o n P r e m )  
 	 	 	 	 	 	 t o o l C u s t ( " C o u l d n ' t   g e t   d i m e n s i o n s   o f   t h e   c l a s s   w i n d o w ` n U s e d   t h e   s e l e c t i o n   h o t k e y   i n s t e a d " ,   2 0 0 0 )  
 	 	 	 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   g e t   d i m e n s i o n s   o f   t h e   c l a s s   w i n d o w   ( p r e m i e r e   i s   a   g o o d   p r o g r a m ) ,   u s e d   t h e   s e l e c t i o n   h o t k e y   i n s t e a d " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 	 	 r e t u r n  
 	 	 	 	 	 }  
 	 	 	 	 s l e e p   1 0 0  
 	 	 	 	 S e n d I n p u t ( t o o l s W i n d o w )  
 	 	 	 	 t o o l s C l a s s N N   : =   C o n t r o l G e t C l a s s N N ( C o n t r o l G e t F o c u s ( " A " ) )  
 	 	 	 	 C o n t r o l G e t P o s ( & t o o l x ,   & t o o l y ,   & w i d t h ,   & h e i g h t ,   t o o l s C l a s s N N )  
 	 	 	 }  
 	 	 }  
 	 i f   h e i g h t   <   8 0   ; i d k   w h y   b u t   i f   t h e   t o o l b a r   p a n e l   i s   l e s s   t h a n   8 0   p i x e l s   t a l l   t h e   i m a g e s e a r c h   f a i l s   f o r   m e ? ? ? ? ,   b u t   i t   o n l y   d o e s   t h a t   i f   u s i n g   t h e   & w i d t h / & h e i g h t   v a l u e s   o f   t h e   c o n t r o l g e t p o s .   A h k   i s   w e i r d   s o m e t i m e s  
 	 	 m u l t i p l y   : =   " 3 "  
 	 e l s e  
 	 	 m u l t i p l y   : =   " 1 "  
 	 l o o p   {  
 	 	 i f   I m a g e S e a r c h ( & x ,   & y ,   t o o l x ,   t o o l y ,   t o o l x   +   w i d t h ,   t o o l y   +   h e i g h t   *   m u l t i p l y ,   " * 2   "   P r e m i e r e   " s e l e c t i o n . p n g " )   ; m o v e s   t o   t h e   s e l e c t i o n   t o o l  
 	 	 	 {  
 	 	 	 	 M o u s e M o v e ( x ,   y )  
 	 	 	 	 b r e a k  
 	 	 	 }  
 	 	 s l e e p   1 0 0  
 	 	 i f   A _ I n d e x   >   3  
 	 	 	 {  
 	 	 	 	 S e n d I n p u t ( s e l e c t i o n P r e m )  
 	 	 	 	 t o o l C u s t ( " s e l e c t i o n   t o o l ` n U s e d   t h e   s e l e c t i o n   h o t k e y   i n s t e a d " ,   2 0 0 0 ,   1 )   ; u s e f u l   t o o l t i p   t o   h e l p   y o u   d e b u g   w h e n   i t   c a n ' t   f i n d   w h a t   i t ' s   l o o k i n g   f o r  
 	 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   s e l e c t i o n   t o o l   ( p r e m i e r e   i s   a   g o o d   p r o g r a m ) ,   u s e d   t h e   s e l e c t i o n   h o t k e y   i n s t e a d " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 r e t u r n  
 	 	 	 }  
 	 }  
 	 c l i c k  
 	 M o u s e M o v e ( x p o s ,   y p o s )  
 }  
  
 ; p r e m p r o j e c t H o t k e y ;  
 R A l t   &   p : :   ; T h i s   h o t k e y   p u l l s   o u t   t h e   p r o j e c t   w i n d o w   a n d   m o v e s   i t   t o   m y   s e c o n d   m o n i t o r   s i n c e   a d o b e   r e f u s e s   t o   j u s t   s a v e   i t s   p o s i t i o n   i n   y o u r   w o r k s p a c e  
 {  
 	 c o o r d s ( )  
 	 s h i f t v a l   : =   0  
 	 M o u s e G e t P o s ( & x p o s ,   & y p o s )  
 	 K e y W a i t ( " A l t " )  
 	 i f   G e t K e y S t a t e ( " C t r l " ,   " P " )  
 	 	 {  
 	 	 	 K e y W a i t ( " C t r l " )  
 	 	 	 g o t o   a d d e d  
 	 	 }  
 	 i f   G e t K e y S t a t e ( " R S h i f t " ,   " P " )  
 	 	 {  
 	 	 	 K e y W a i t ( " R S h i f t " )  
 	 	 	 s h i f t v a l   : =   1  
 	 	 }  
 	 S e n d I n p u t ( r e s e t W o r k s p a c e )  
 	 s l e e p   1 5 0 0  
 	 S e n d I n p u t ( t i m e l i n e W i n d o w )   ; a d j u s t   t h i s   s h o r t c u t   i n   t h e   i n i   f i l e  
 	 S e n d I n p u t ( p r o j e c t s W i n d o w )   ; a d j u s t   t h i s   s h o r t c u t   i n   t h e   i n i   f i l e  
 	 S e n d I n p u t ( p r o j e c t s W i n d o w )   ; a d j u s t   t h i s   s h o r t c u t   i n   t h e   i n i   f i l e  
 	 s l e e p   3 0 0  
 	 s a n i t y   : =   W i n G e t P o s ( & s a n X ,   & s a n Y , , ,   " A " )   ; i f   y o u   h a v e   t h i s   p a n e l   o n   a   d i f f e r e n t   m o n i t o r   a h k   w o n ' t   b e   a b l e   t o   f i n d   i t   b e c a u s e   o f   p r e m i e r e   w e i r d n e s s   s o   t h i s   v a l u e   w i l l   b e   u s e d   i n   s o m e   f a l l b a c k   c o d e   d o w n   b e l o w  
 	 c o o r d w ( )  
 	 t r y   {  
 	 	 l o o p   {  
 	 	 	 C l a s s N N   : =   C o n t r o l G e t C l a s s N N ( C o n t r o l G e t F o c u s ( " A " ) )  
 	 	 	 C o n t r o l G e t P o s ( & t o o l x ,   & t o o l y ,   & w i d t h ,   & h e i g h t ,   C l a s s N N )  
 	 	 	 / *   i f   C l a s s N N   ! =   " D r o v e r L o r d   -   W i n d o w   C l a s s 3 "  
 	 	 	 	 b r e a k   * /  
 	 	 	 ; t h e   w i n d o w   y o u ' r e   s e a r c h i n g   f o r   c a n   e n d   u p   b e i n g   w i n d o w   c l a s s   3 .   W i c k e d .   T h e   f u n c t i o n   w i l l   n o w   a t t e m p t   t o   c o n t i n u e   o n   w i t h o u t   t h e s e   v a l u e s   i f   i t   d o e s n ' t   g e t   t h e m   a s   i t   c a n   s t i l l   w o r k   d u e   t o   o t h e r   i n f o r m a t i o n   w e   g r a b   a l o n g   t h e   w a y  
 	 	 	 i f   A _ I n d e x   >   5  
 	 	 	 	 {  
 	 	 	 	 	 ; t o o l C u s t ( " F u n c t i o n   f a i l e d   t o   f i n d   p r o j e c t   w i n d o w " )  
 	 	 	 	 	 ; e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " F u n c t i o n   f a i l e d   t o   f i n d   C l a s s N N   v a l u e   t h a t   w a s n ' t   t h e   t i m e l i n e " ,   A _ L i n e N u m b e r )  
 	 	 	 	 	 b r e a k  
 	 	 	 	 }  
 	 	 }  
 	 }   c a t c h   a s   e  
 	 	 {  
 	 	 	 t o o l C u s t ( " F u n c t i o n   f a i l e d   t o   f i n d   p r o j e c t   w i n d o w " )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " F u n c t i o n   f a i l e d   t o   f i n d   p r o j e c t   w i n d o w " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 	 ; M s g B o x ( " x   "   t o o l x   " ` n y   "   t o o l y   " ` n w i d t h   "   w i d t h   " ` n h e i g h t   "   h e i g h t   " ` n c l a s s   "   C l a s s N N )   ; d e b u g g i n g  
 	 b l o c k O n ( )  
 	 t r y   {  
 	 	 i f   I m a g e S e a r c h ( & p r x ,   & p r y ,   t o o l x   -   " 5 " ,   t o o l y   -   " 2 0 " ,   t o o l x   +   " 1 0 0 0 " ,   t o o l y   +   " 1 0 0 " ,   " * 2   "   P r e m i e r e   " p r o j e c t . p n g " )   | |   I m a g e S e a r c h ( & p r x ,   & p r y ,   t o o l x   -   " 5 " ,   t o o l y   -   " 2 0 " ,   t o o l x   +   " 1 0 0 0 " ,   t o o l y   +   " 1 0 0 " ,   " * 2   "   P r e m i e r e   " p r o j e c t 2 . p n g " )   ; s e a r c h e s   f o r   t h e   p r o j e c t   w i n d o w   t o   g r a b   t h e   t r a c k  
 	 	 	 g o t o   m o v e  
 	 	 e l s e   i f   I m a g e S e a r c h ( & p r x ,   & p r y ,   t o o l x ,   t o o l y ,   w i d t h ,   h e i g h t ,   " * 2   "   P r e m i e r e   " p r o j e c t 2 . p n g " )   ; I   h o n e s t l y   h a v e   n o   i d e a   w h a t   t h e   o r i g i n a l   p u r p o s e   o f   t h i s   l i n e   w a s  
 	 	 	 g o t o   b i n  
 	 	 e l s e  
 	 	 	 {  
 	 	 	 	 c o o r d s ( )  
 	 	 	 	 i f   I m a g e S e a r c h ( & p r x ,   & p r y ,   s a n X   -   " 5 " ,   s a n Y   -   " 2 0 " ,   s a n X   +   " 1 0 0 0 " ,   s a n Y   +   " 1 0 0 " ,   " * 2   "   P r e m i e r e   " p r o j e c t . p n g " )   | |   I m a g e S e a r c h ( & p r x ,   & p r y ,   s a n X   -   " 5 " ,   s a n Y   -   " 2 0 " ,   s a n X   +   " 1 0 0 0 " ,   s a n Y   +   " 1 0 0 " ,   " * 2   "   P r e m i e r e   " p r o j e c t 2 . p n g " )   ; T h i s   i s   t h e   f a l l b a c k   c o d e   i f   y o u   h a v e   i t   o n   a   d i f f e r e n t   m o n i t o r  
 	 	 	 	 	 g o t o   m o v e  
 	 	 	 	 e l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 b l o c k O f f ( )  
 	 	 	 	 	 	 t o o l C u s t ( " p r o j e c t   w i n d o w " ,   2 0 0 0 ,   1 )   ; u s e f u l   t o o l t i p   t o   h e l p   y o u   d e b u g   w h e n   i t   c a n ' t   f i n d   w h a t   i t ' s   l o o k i n g   f o r  
 	 	 	 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   p r o j e c t   w i n d o w " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 	 	 r e t u r n  
 	 	 	 	 	 	 ; i f   t h e   p r o j e c t   w i n d o w   i s   o n   a   s e c o n d a r y   m o n i t o r   a h k   c a n   h a v e   a   d i f f i c u l t   t i m e   t r y i n g   t o   f i n d   i t .   I   h a v e   t h i s   i s s u e   w i t h   t h e   m o n i t o r   t o   t h e   l e f t   o f   m y   " m a i n "   d i s p l a y  
 	 	 	 	 	 }  
 	 	 	 }  
 	 }   c a t c h   a s   e   {  
 	 	 b l o c k O f f ( )  
 	 	 t o o l C u s t ( " C o u l d n ' t   f i n d   t h e   p r o j e c t   w i n d o w " )  
 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   p r o j e c t   w i n d o w " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 r e t u r n  
 	 }  
 	 m o v e :  
 	 M o u s e M o v e ( p r x   +   " 5 " ,   p r y   + " 3 " )  
 	 S e n d I n p u t ( " { C l i c k   D o w n } " )  
 	 c o o r d s ( )  
 	 S l e e p   1 0 0  
 	 M o u s e M o v e   3 5 9 2 ,   4 4 4 ,   2  
 	 s l e e p   5 0  
 	 S e n d I n p u t ( " { C l i c k   U p } " )  
 	 M o u s e M o v e ( x p o s ,   y p o s )  
 	 i f   s h i f t v a l   =   1  
 	 	 {  
 	 	 	 b l o c k O f f ( )  
 	 	 	 r e t u r n  
 	 	 }  
 	 b i n :  
 	 i f   W i n E x i s t ( " _ E d i t i n g   s t u f f " )  
 	 	 {  
 	 	 	 W i n A c t i v a t e ( " _ E d i t i n g   s t u f f " )  
 	 	 	 S e n d I n p u t ( " { U p } " )  
 	 	 }  
 	 e l s e  
 	 	 {  
 	 	 	 R u n ( " E : \ _ E d i t i n g   s t u f f " )  
 	 	 	 W i n W a i t ( " _ E d i t i n g   s t u f f " )  
 	 	 	 W i n A c t i v a t e ( " _ E d i t i n g   s t u f f " )  
 	 	 }  
 	 s l e e p   2 5 0  
 	 i s F u l l s c r e e n ( & t i t l e ,   & f u l l )  
 	 i f   f u l l   =   1   ; a   r e t u r n   v a l u e   o f   1   m e a n s   i t   i s   m a x i m i s e d  
 	 	 W i n R e s t o r e ( t i t l e )   ; w i n r e s t o r e   w i l l   u n m a x i m i s e   i t  
 	 n e w W i d t h   : =   1 6 0 0  
 	 n e w H e i g h t   : =   9 0 0  
 	 n e w X   : =   A _ S c r e e n W i d t h   /   2   -   n e w W i d t h   /   2  
 	 n e w Y   : =   n e w X   /   2  
 	 ;   M o v e   a n y   w i n d o w   t h a t ' s   n o t   t h e   d e s k t o p  
 	 t r y {  
 	 	 W i n M o v e ( n e w X ,   n e w Y ,   n e w W i d t h ,   n e w H e i g h t ,   t i t l e )  
 	 }  
 	 s l e e p   2 5 0  
 	 c o o r d w ( )  
 	 M o u s e M o v e ( 0 ,   0 )  
 	 i f   I m a g e S e a r c h ( & f o l d x ,   & f o l d y ,   0 ,   0 ,   A _ S c r e e n W i d t h ,   A _ S c r e e n H e i g h t ,   " * 2   "   E x p l o r e r   " s f x . p n g " )  
 	 	 {  
 	 	 	 M o u s e M o v e ( f o l d x   +   " 9 " ,   f o l d y   +   " 5 " ,   2 )  
 	 	 	 S e n d I n p u t ( " { C l i c k   D o w n } " )  
 	 	 	 ; s l e e p   2 0 0 0  
 	 	 	 c o o r d s ( )  
 	 	 	 M o u s e M o v e ( 3 2 4 0 ,   5 6 4 ,   " 2 " )  
 	 	 	 S e n d I n p u t ( " { C l i c k   U p } " )  
 	 	 	 s w i t c h T o P r e m i e r e ( )  
 	 	 	 W i n W a i t C l o s e ( " I m p o r t   F i l e s " )  
 	 	 	 s l e e p   1 0 0 0  
 	 	 }  
 	 e l s e  
 	 	 {  
 	 	 	 b l o c k O f f  
 	 	 	 t o o l C u s t ( " t h e   s f x   f o l d e r " ,   2 0 0 0 ,   1 )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   s f x   f o l d e r   i n   W i n d o w s   E x p l o r e r " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 	 a d d e d :  
 	 c o o r d w ( )  
 	 W i n A c t i v a t e ( " a h k _ e x e   A d o b e   P r e m i e r e   P r o . e x e " )  
 	 i f   I m a g e S e a r c h ( & l i s t x ,   & l i s t y ,   1 0 ,   3 ,   1 0 3 8 ,   1 0 7 2 ,   " * 2   "   P r e m i e r e   " l i s t   v i e w . p n g " )  
 	 	 {  
 	 	 	 M o u s e M o v e ( l i s t x ,   l i s t y )  
 	 	 	 S e n d I n p u t ( " { C l i c k } " )  
 	 	 	 s l e e p   1 0 0  
 	 	 }  
 	 i f   I m a g e S e a r c h ( & f o l d 2 x ,   & f o l d 2 y ,   1 0 ,   3 ,   1 0 3 8 ,   1 0 7 2 ,   " * 2   "   P r e m i e r e   " s f x i n p r o j . p n g " )   | |   I m a g e S e a r c h ( & f o l d 2 x ,   & f o l d 2 y ,   1 0 ,   3 ,   1 0 3 8 ,   1 0 7 2 ,   " * 2   "   P r e m i e r e   " s f x i n p r o j 2 . p n g " )  
 	 	 {  
 	 	 	 M o u s e M o v e ( f o l d 2 x   +   " 5 " ,   f o l d 2 y   +   " 2 " )  
 	 	 	 S e n d I n p u t ( " { C l i c k   2 } " )  
 	 	 	 s l e e p   1 0 0  
 	 	 }  
 	 e l s e  
 	 	 {  
 	 	 	 b l o c k O f f ( )  
 	 	 	 t o o l C u s t ( " t h e   s f x   f o l d e r   i n   p r e m i e r e " ,   2 0 0 0 ,   1 )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   s f x   f o l d e r   i n   P r e m i e r e   P r o " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 	 l o o p   {  
 	 	 i f   I m a g e S e a r c h ( & f o l d 3 x ,   & f o l d 3 y ,   1 0 ,   0 ,   1 0 3 8 ,   1 0 7 2 ,   " * 2   "   P r e m i e r e   " b i n s f x . p n g " )  
 	 	 	 {  
 	 	 	 	 M o u s e M o v e ( f o l d 3 x   +   " 2 0 " ,   f o l d 3 y   +   " 4 " ,   2 )  
 	 	 	 	 S e n d I n p u t ( " { C l i c k   D o w n } " )  
 	 	 	 	 M o u s e M o v e ( 7 7 2 ,   9 9 3 ,   2 )  
 	 	 	 	 s l e e p   2 5 0  
 	 	 	 	 S e n d I n p u t ( " { C l i c k   U p   L e f t } " )  
 	 	 	 	 b r e a k  
 	 	 	 }  
 	 	 i f   A _ I n d e x   >   5  
 	 	 	 {  
 	 	 	 	 b l o c k O f f ( )  
 	 	 	 	 t o o l C u s t ( " t h e   b i n " ,   2 0 0 0 ,   1 )  
 	 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " C o u l d n ' t   f i n d   t h e   b i n " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 	 r e t u r n  
 	 	 	 }  
 	 }  
 	 c o o r d s ( )  
 	 M o u s e M o v e ( x p o s ,   y p o s )  
 	 b l o c k O f f ( )  
 }  
  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ;  
 ; 	 	 M o u s e   S c r i p t s  
 ;  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ; p r e m p r e v i o u s e d i t H o t k e y ;  
 F 2 1 : : w h e e l E d i t P o i n t ( p r e v i o u s E d i t P o i n t )   ; g o e s   t o   t h e   n e x t   e d i t   p o i n t   t o w a r d s   t h e   l e f t  
 ; p r e m n e x t e d i t H o t k e y ;  
 F 2 3 : : w h e e l E d i t P o i n t ( n e x t E d i t P o i n t )   ; g o e s   t o   t h e   n e x t   e d i t   p o i n t   t o w a r d s   t h e   r i g h t  
 ; p l a y s t o p H o t k e y ;  
 F 1 8 : : S e n d I n p u t ( p l a y S t o p )   ; a l t e r n a t e   w a y   t o   p l a y / s t o p   t h e   t i m e l i n e   w i t h   a   m o u s e   b u t t o n  
 ; n u d g e u p H o t k e y ;  
 F 1 4 : : S e n d I n p u t ( n u d g e U p )   ; s e t t i n g   t h i s   h e r e   i n s t e a d   o f   w i t h i n   p r e m i e r e   i s   r e q u i r e d   f o r   t h e   b e l o w   h o t k e y s   t o   f u n c t i o n   p r o p e r l y  
 ; p r e m s l o w D o w n H o t k e y ;  
 F 1 4   &   F 2 1 : : S e n d I n p u t ( s l o w D o w n P l a y b a c k )   ; a l t e r n a t e   w a y   t o   s l o w   d o w n   p l a y b a c k   o n   t h e   t i m e l i n e   w i t h   m o u s e   b u t t o n s  
 ; p r e m s p e e d U p H o t k e y ;  
 F 1 4   &   F 2 3 : : S e n d I n p u t ( s p e e d U p P l a y b a c k )   ; a l t e r n a t e   w a y   t o   s p e e d   u p   p l a y b a c k   o n   t h e   t i m e l i n e   w i t h   m o u s e   b u t t o n s  
 ; p r e m n u d g e d o w n H o t k e y ;  
 X b u t t o n 1 : : S e n d I n p u t ( n u d g e D o w n )   ; S e t   c t r l   w   t o   " N u d g e   C l i p   S e l e c t i o n   D o w n "  
 ; p r e m m o u s e d r a g 1 H o t k e y ;  
 L A l t   &   X b u t t o n 2 : :   ; t h i s   i s   n e c e s s a r y   f o r   t h e   b e l o w   f u n c t i o n   t o   w o r k  
 ; p r e m m o u s e d r a g 2 H o t k e y ;  
 X b u t t o n 2 : : m o u s e d r a g ( h a n d P r e m ,   s e l e c t i o n P r e m )   ; c h a n g e s   t h e   t o o l   t o   t h e   h a n d   t o o l   w h i l e   m o u s e   b u t t o n   i s   h e l d   ; c h e c k   t h e   v a r i o u s   F u n c t i o n s   s c r i p t s   f o r   t h e   c o d e   t o   t h i s   p r e s e t   &   t h e   k e y b o a r d   s h o r t c u t s   i n i   f i l e   f o r   t h e   t o o l   s h o r t c u t s  
  
 ; p r e m g o o s e H o t k e y ;  
 F 1 9 : : a u d i o D r a g ( " G o o s e _ h o n k " )   ; d r a g   m y   b l e e p   ( g o o s e )   s f x   t o   t h e   c u r s o r   ; I   h a v e   a   b u t t o n   o n   m y   m o u s e   s p i t   o u t   F 1 9   &   F 2 0  
 ; p r e m b l e e p H o t k e y ;  
 F 2 0 : : a u d i o D r a g ( " b l e e p " )  
  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ;  
 ; 	 	 o t h e r   -   N O T   a n   e d i t o r  
 ;  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 # H o t I f   n o t   W i n A c t i v e ( " a h k _ g r o u p   E d i t o r s " )   ; c o d e   b e l o w   h e r e   ( u n t i l   t h e   n e x t   # H o t I f )   w i l l   t r i g g e r   a s   l o n g   a s   p r e m i e r e   p r o   &   a f t e r   e f f e c t s   a r e n ' t   a c t i v e  
  
 ; w i n m a x H o t k e y ;  
 F 1 4 : : m o v e W i n ( " " )   ; m a x i m i s e  
 ; w i n l e f t H o t k e y ;  
 X B u t t o n 2 : : m o v e W i n ( " # { L e f t } " )   ; s n a p   l e f t  
 ; w i n r i g h t H o t k e y ;  
 X B u t t o n 1 : : m o v e W i n ( " # { R i g h t } " )   ; s n a p   r i g h t  
 ; w i n m i n H o t k e y ;  
 R B u t t o n : : m o v e W i n ( " " )   ; m i n i m i s e  
  
 ; a l w a y s o n t o p H o t k e y ;  
 ^ S P A C E : : W i n S e t A l w a y s O n T o p   - 1 ,   " A "   ;   w i l l   t o g g l e   t h e   c u r r e n t   w i n d o w   t o   r e m a i n   o n   t o p  
  
 ; s e a r c h g o o g l e H o t k e y ;  
 ^ + c : :   ; r u n s   a   g o o g l e   s e a r c h   o f   h i g h l i g h t e d   t e x t  
 {  
 	 p r e v i o u s   : =   A _ C l i p b o a r d  
 	 A _ C l i p b o a r d   : =   " "   ; c l e a r s   t h e   c l i p b o a r d  
 	 S e n d ( " ^ c " )  
 	 i f   ! C l i p W a i t ( 1 )   ; w a i t s   f o r   t h e   c l i p b o a r d   t o   c o n t a i n   d a t a  
 	 	 {  
 	 	 	 t o o l C u s t ( " C o u l d n ' t   c o p y   d a t a   t o   c l i p b o a r d " )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " c o u l d n ' t   c o p y   d a t a   t o   c l i p b o a r d " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 	 R u n ( " h t t p s : / / w w w . g o o g l e . c o m / s e a r c h ? d & q = "   A _ C l i p b o a r d )  
 	 A _ C l i p b o a r d   : =   p r e v i o u s  
 }  
  
 ; c a p i t a l i s e H o t k e y ;  
 S C 0 3 A   &   c : :   ; w i l l   a t t e m p t   t o   d e t e r m i n e   w h e t h e r   t o   c a p i t i l i s e   o r   c o m p l e t e l y   l o w e r c a s e   t h e   h i g h l i g h t e d   t e x t   d e p e n d i n g   o n   w h i c h   i s   m o r e   f r e q u e n t  
 {  
 	 p r e v i o u s   : =   A _ C l i p b o a r d  
 	 A _ C l i p b o a r d   : =   " "   ; c l e a r s   t h e   c l i p b o a r d  
 	 S e n d ( " ^ c " )  
 	 i f   ! C l i p W a i t ( 1 )   ; w a i t s   f o r   t h e   c l i p b o a r d   t o   c o n t a i n   d a t a  
 	 	 {  
 	 	 	 A _ C l i p b o a r d   : =   p r e v i o u s  
 	 	 	 t o o l C u s t ( " C o u l d n ' t   c o p y   d a t a   t o   c l i p b o a r d " )  
 	 	 	 e r r o r L o g ( A _ T h i s H o t k e y   " : : " ,   " c o u l d n ' t   c o p y   d a t a   t o   c l i p b o a r d " ,   A _ L i n e F i l e ,   A _ L i n e N u m b e r )  
 	 	 	 r e t u r n  
 	 	 }  
 	 l e n g t h   : =   S t r L e n ( A _ C l i p b o a r d )  
 	 i f   l e n g t h   >   9 9 9 9   ; p e r s o n a l l y   I   s t a r t e d   e n c o u n t e r i n g   i s s u e s   a t   a b o u t   1 6 k   c h a r a c t e r s   b u t   I ' m   d r o p p i n g   t h a t   j u s t   t o   b e   s a f e  
 	 	 {  
 	 	 	 c h e c k   : =   M s g B o x ( " S t r i n g s   t h a t   a r e   t o o   l a r g e   m a y   t a k e   a   l o n g   t i m e   t o   p r o c e s s   a n d   a r e   g e n e r a l l y   u n a b l e   t o   b e   s t o p p e d   w i t h o u t   u s i n g   t a s k m a n a g e r   t o   k i l l   t h e   p r o c e s s ` n ` n T h e y   a l s o   m a y   e v e n t u a l l y   s t a r t   s e n d i n g   g i b b e r i s h   a s   t h i n g s   a r e n ' t   a b l e   t o   k e e p   u p ` n ` n A r e   y o u   s u r e   y o u   w i s h   t o   c o n t i n u e ? " ,   " D o u b l e   C h e c k " ,   " 4   4 8   4 0 9 6 " )  
 	 	 	 i f   c h e c k   =   " N o "  
 	 	 	 	 r e t u r n  
 	 	 }  
 	 u p p e r C o u n t   : =   0  
 	 l o w e r C o u n t   : =   0  
 	 n o n A l p h a C o u n t   : =   0  
 	 l o o p   l e n g t h  
 	 	 {  
 	 	 	 t e s t   : =   S u b S t r ( A _ C l i p b o a r d ,   A _ I n d e x ,   1 )  
 	 	 	 i f   I s U p p e r ( t e s t )   =   t r u e  
 	 	 	 	 u p p e r C o u n t   + =   1  
 	 	 	 e l s e   i f   I s L o w e r ( t e s t )   =   t r u e  
 	 	 	 	 l o w e r C o u n t   + =   1  
 	 	 	 e l s e   i f   I s A l p h a ( t e s t )   =   f a l s e  
 	 	 	 	 n o n A l p h a C o u n t   + =   1  
 	 	 }  
 	 t o o l C u s t ( " U p p e r c a s e   c h a r   =   "   u p p e r C o u n t   " ` n L o w e r c a s e   c h a r   =   "   l o w e r C o u n t   " ` n A m o u n t   o f   c h a r   c o u n t e d   =   "   l e n g t h   -   n o n A l p h a C o u n t ,   2 0 0 0 )  
 	 i f   u p p e r C o u n t   > =   ( ( l e n g t h   -   n o n A l p h a C o u n t ) / 2 )  
 	 	 S t r i n g t o X   : =   S t r L o w e r ( A _ C l i p b o a r d )  
 	 e l s e   i f   l o w e r C o u n t   > =   ( ( l e n g t h   -   n o n A l p h a C o u n t ) / 2 )  
 	 	 S t r i n g t o X   : =   S t r U p p e r ( A _ C l i p b o a r d )  
 	 e l s e  
 	 	 {  
 	 	 	 A _ C l i p b o a r d   : =   p r e v i o u s  
 	 	 	 t o o l C u s t ( " C o u l d n ' t   d e t e r m i n e   w h e t h e r   t o   U p p e r c a s e   o r   L o w e r c a s e   t h e   c l i p b o a r d ` n U p p e r c a s e   c h a r   =   "   u p p e r C o u n t   " ` n L o w e r c a s e   c h a r   =   "   l o w e r C o u n t   " ` n A m o u n t   o f   c h a r   c o u n t e d   =   "   l e n g t h   -   n o n A l p h a C o u n t ,   2 0 0 0 )  
 	 	 	 r e t u r n  
 	 	 }  
 	 S e n d I n p u t ( " { B a c k S p a c e } " )  
 	 S e n d T e x t ( S t r i n g t o X )  
 	 A _ C l i p b o a r d   : =   p r e v i o u s  
 }  
  
 ; t i m e H o t k e y ;  
 ^ + t : :  
 {  
 	 i f   W i n A c t i v e ( " a h k _ g r o u p   B r o w s e r s " )   & &   ! W i n A c t i v e ( " a h k _ c l a s s   # 3 2 7 7 0 " )  
 	 	 {  
 	 	 	 S e n d I n p u t ( A _ T h i s H o t k e y )  
 	 	 	 r e t u r n  
 	 	 }  
 	 S e n d I n p u t ( A _ Y Y Y Y   " - "   A _ M M   " - "   A _ D D )  
 }  
  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ;  
 ; 	 	 M o u s e   S c r i p t s  
 ;  
 ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 ; Y o u   c a n   c h e c k   o u t   \ m o u s e   s e t t i n g s . p n g   i n   t h e   r o o t   r e p o   t o   c h e c k   w h a t   m o u s e   b u t t o n s   I   h a v e   r e m a p p e d  
 ; T h e   b e l o w   s c r i p t s   a r e   t o   a c c e l e r a t e   s c r o l l i n g  
 ; w h e e l u p H o t k e y ;  
 F 1 4   &   W h e e l D o w n : : S e n d I n p u t ( " { W h e e l D o w n   1 0 } " )   ; I   h a v e   o n e   o f   m y   m o u s e   b u t t o n s   s e t   t o   F 1 4 ,   s o   t h i s   i s   a n   e a s y   w a y   t o   a c c e l e r a t e   s c r o l l i n g .   T h e s e   s c r i p t s   m i g h t   d o   t o o   m u c h / l i t t l e   d e p e n d i n g   o n   w h a t   y o u   h a v e   y o u r   w i n d o w s   m o u s e   s c r o l l   s e t t i n g s   s e t   t o .  
 ; w h e e l d o w n H o t k e y ;  
 F 1 4   &   W h e e l U p : : S e n d I n p u t ( " { W h e e l U p   1 0 } " )   ; I   h a v e   o n e   o f   m y   m o u s e   b u t t o n s   s e t   t o   F 1 4 ,   s o   t h i s   i s   a n   e a s y   w a y   t o   a c c e l e r a t e   s c r o l l i n g .   T h e s e   s c r i p t s   m i g h t   d o   t o o   m u c h / l i t t l e   d e p e n d i n g   o n   w h a t   y o u   h a v e   y o u r   w i n d o w s   m o u s e   s c r o l l   s e t t i n g s   s e t   t o .  
  
 ; T h e   b e l o w   s c r i p t s   a r e   t o   s w a p   b e t w e e n   v i r t u a l   d e s k t o p s  
 ; v i r t u a l r i g h t H o t k e y ;  
 F 1 9   &   X B u t t o n 2 : : S e n d I n p u t ( " ^ # { R i g h t } " )   ; y o u   d o n ' t   n e e d   t h e s e   t w o   a s   a   s e n d i n p u t ,   t h e   s y n t a x   h i g h l i g h t i n g   I ' m   u s i n g   j u s t   s e e ' s   ^ # R i g h t   a s   a n   e r r o r   a n d   i t ' s   a n n o y i n g  
 ; v i r t u a l l e f t H o t k e y ;  
 F 1 9   &   X B u t t o n 1 : : S e n d I n p u t ( " ^ # { L e f t } " )  
  
 ; T h e   b e l o w   s c r i p t s   a r e   t o   s k i p   a h e a d   i n   t h e   y o u t u b e   p l a y e r   w i t h   t h e   m o u s e  
 ; y o u s k i p b a c k H o t k e y ;  
 F 2 1 : : y o u M o u s e ( " j " ,   " { L e f t } " )  
 ; y o u s k i p f o r H o t k e y ;  
 F 2 3 : : y o u M o u s e ( " l " ,   " { R i g h t } " ) 