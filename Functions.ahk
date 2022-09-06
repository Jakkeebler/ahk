S e t W o r k i n g D i r   A _ S c r i p t D i r     ;   E n s u r e s   a   c o n s i s t e n t   s t a r t i n g   d i r e c t o r y .  
 # S i n g l e I n s t a n c e   F o r c e  
 # I n c l u d e   " % A _ S c r i p t D i r % \ K S A \ K e y b o a r d   S h o r t c u t   A d j u s t m e n t s . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ S t a r t u p . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ A f t e r   E f f e c t s . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ P h o t o s h o p . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ P r e m i e r e . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ R e s o l v e . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ s w i t c h T o . a h k "  
 # I n c l u d e   " % A _ S c r i p t D i r % \ F u n c t i o n s \ W i n d o w s . a h k "  
  
 ; \ \ C U R R E N T   S C R I P T   V E R S I O N \ \ T h i s   i s   a   " s c r i p t "   l o c a l   v e r s i o n   a n d   d o e s n ' t   r e l a t e   t o   t h e   R e l e a s e   V e r s i o n  
 ; \ \ v 2 . 1 0 . 2  
  
 ; \ \ C U R R E N T   R E L E A S E   V E R S I O N  
 ; \ \ v 2 . 5 . 2  
  
 ;   A l l   o f   m y   f u n c t i o n s   u s e   t o   b e   c o n t a i n e d   w i t h i n   t h i s   i n d i v i d u a l   f i l e   b u t   h a v e   s i n c e   b e e n   s p l i t   o f f   i n t o   t h e i r   o w n   i n d i v i d u a l   f i l e s   w h i c h   c a n   b e   f o u n d   i n   t h e   \ F u n c t i o n s \   f o l d e r   i n   t h e   r o o t   o f   t h e   d i r e c t o r y .  
 ;   T h e   t e x t   b e l o w   w a s   a l l   w r i t t e n   b a c k   w h e n   t h a t   w a s   t h e   c a s e   s o   i t   m i g h t   n o t   m a k e   m u c h   s e n s e   i n   i t s   c u r r e n t   f o r m   b u t   j u s t   a s s u m e   e v e r y t h i n g   b e l o w   r e l a t e s   t o   e v e r y t h i n g  
 ;   T h i s   f i l e   n o w   j u s t   a c t s   a s   a   s c r i p t   t h a t   a l l   t h e   o t h e r s   f e e d   i n t o   s o   t h a t   I   c a n   j u s t   # I n c l u d e   t h i s   o n e   s c r i p t   i n   a l l   m y   o t h e r   s c r i p t s  
  
 ;   A l l   C o d e   i n   t h i s   s c r i p t   ( a n d   t h e   i n d i v i d u a l   f u n c t i o n s   s c r i p t s   f o u n d   i n   \ F u n c t i o n s \ )   i s   l i n k e d   t o   a   f u n c t i o n  
 ;   f o r   e x a m p l e :  
 ;   f u n c ( v a r i a b l e )  
 ;   	 {  
 ; 	 	 c o d e ( % & v a r i a b l e % )  
 ; 	 }  
 ;   T h e n   i n   o u r   m a i n   s c r i p t s   w e   c a l l   o n   t h e s e   f u n c t i o n s   l i k e :  
 ;   H o t k e y : : f u n c ( " i n f o r m a t i o n " )  
 ;   t h e n   w h a t e v e r   y o u   p l a c e   w i t h i n   t h e   " "   w i l l   b e   p u t   w h e r e v e r   y o u   h a v e   a   % & v a r i a b l e %  
 ;   I   m a k e   u s e   o f   c o d e   l i k e   t h i s   a l l   t h r o u g h o u t   t h i s   s c r i p t .   A l l   v a r i a b l e s   a r e   e x p l a i n e d   a b o v e   t h e i r   r e s p e c t i v e   f u n c t i o n s   a n d   d y n a m i c a l l y   d i s p l a y   t h a t   i n f o r m a t i o n   w h e n   y o u   h o v e r   o v e r   a   f u n c t i o n   i f   y o u ' r e   u s i n g   V S C o d e  
  
 ;   I   h a v e   m a d e   a   c o n c i o u s   e f f o r t   t h r o u g h o u t   t h e   w o r k i n g s   o f   t h i s   s c r i p t   t o   k e e p   o u t   a s   m a n y   r a w   p i x e l   c o o r d s   a s   p o s s i b l e ,   p r e f e r r i n g   i m a g e s e a r c h e s   t o   e n s u r e   c o r r e c t   m o u s e   m o v e m e n t s  
 ;   b u t   e v e n   s t i l l ,   a n   i m a g e s e a r c h   s t i l l   h a s   a   d e f i n a b l e   a r e a   t h a t   i t   s e a r c h e s   f o r   e a c h   i m a g e ,   f o r   e x a m p l e  
 ;   I m a g e S e a r c h ( & x p o s ,   & y p o s ,   3 1 2 ,   6 4 ,   1 0 6 6 ,   1 4 7 9 , ~ ~ ~ ~ ~ )   ( c h e c k   t h e   a h k   d o c u m e n t a t i o n   f o r   w h a t   e a c h   n u m b e r   r e p r e s e n t s )  
 ;   s e a r c h e s   i n   a   r e c t a n g l e   d e f i n e d   b y   t h e   a b o v e   c o o r d s   ( p i x e l   c o o r d s   d e f a u l t   t o   w i n d o w   u n l e s s   y o u   c h a n g e   i t   t o   s o m e t h i n g   e l s e )  
 ;   T h e s e   v a l u e s   w i l l   b e   t h e   o n l y   t h i n g   y o u   s h o u l d   t h e o r e t i c a l l y   n e e d   t o   c h a n g e   t o   g e t   t h i n g s   w o r k i n g   i n   y o u r   o w n   s e t u p s   ( o u t s i d e   o f   p o t e n t i a l l y   n e e d i n g   y o u r   o w n   s c r e e n s h o t s   f o r   t h i n g s   a s   d i f f e r e n t   s e t u p s   c a n   m e a n   d i f f e r e n t   c o l o u r s   e t c   e t c )  
 ;   M o s t   p r e m i e r e   f u n c t i o n s   r e q u i r e   n o   t i n k e r i n g   b e f o r e   g e t t i n g   s t a r t e d   a s   w e   c a n   s n e a k i l y   g r a b   t h e   c o o r d i n a t e s   o f   s o m e   p a n e l s   w i t h i n   p r e m i e r e   w i t h o u t   n e e d i n g   t o   d e f i n e   t h e m   a n y w h e r e .   N o t   a l l   o f   m y   s c r i p t s   h a v e   t h i s   k i n d   o f   t r e a t m e n t   t h o u g h   a s   s o m e t i m e s   i t ' s   j u s t   n o t   p r a c t i c a l ,   s o m e t i m e s   a   f u n c t i o n   i s   s o   h e a v i l y   r e l i a n t   o n   m y   w o r k s p a c e / w o r k f l o w   t h a t   i t   w o u l d   b e   a   w a s t e   o f   t i m e   a s   y o u ' d   n e e d   t o   c h a n g e   a   b u n c h   o f   s t u f f   a n y w a y ,   o r   s o m e t i m e s   i t ' s   j u s t   n o t   p o s s i b l e   w i t h   t h e   w a y   I ' m   d o i n g   t h i n g s .  
 ;   F o r   t h e   f u n c t i o n s   t h a t   d o n ' t   g e t   t h i s   s p e c i a l   t r e a t m e n t ,   I   h a v e   t r i e d   t o   m a k e   a s   m a n y   o f   t h e s e   v a l u e s   a s   p o s s i b l e   d i r e c t l y   e d i t a b l e   w i t h i n   K S I . i n i   t o   m a k e   i t   b o t h   e a s i e r   a n d   f a s t e r   f o r   y o u   t o   a d j u s t   t h e s e   s c r i p t s   t o   y o u r   o w n   l a y o u t s .   T a k e   a   l o o k   o v e r   t h e r e   b e f o r e   l o o k i n g   a r o u n d   i n   h e r e  
  
 ;   H e r e   w e   w i l l   d e f i n e   a   b u n c h   o f   g l o b a l   v a r i a b l e s   t h a t   w e   w i l l   r e f e r e n c e   i n   I m a g e S e a r c h e s .   T h i s   i s   s i m p l y   t o   h e l p   c u t   d o w n   t h e   a m o u n t   o f   t h i n g s   n e e d e d   t o   w r i t e   o u t   a n d   a l s o   t o   j u s t   m a k e   t h i n g s   c l e a n e r   o v e r a l l   t o   l o o k   a t   a n d   h e l p   d i s c e r n .   P l e a s e   n o t e   I   h a v e   n o   w a y   t o   a d d   d y n a m i c   c o m m e n t s   t o   t h e s e   f o r   V S C o d e   u s e r s .  
 