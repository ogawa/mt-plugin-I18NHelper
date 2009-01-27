# $Id$
package I18NHelper;
use strict;
use MT::I18N;

sub block_guess_encoding {
    my ( $ctx, $args ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $text = $builder->build( $ctx, $tokens ) )
      or return $ctx->error( $builder->errstr );
    return MT::I18N::guess_encoding($text);
}

sub block_encode_text {
    my ( $ctx, $args ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $text = $builder->build( $ctx, $tokens ) )
      or return $ctx->error( $builder->errstr );
    my $from = $args->{'from'} || '';
    my $to   = $args->{'to'}   || '';
    return MT::I18N::encode_text( $text, $from, $to );
}

sub block_substr_text {
    my ( $ctx, $args ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $text = $builder->build( $ctx, $tokens ) )
      or return $ctx->error( $builder->errstr );
    my $startpos = $args->{'startpos'} || 0;
    my $length   = $args->{'length'}   || 0;
    return MT::I18N::substr_text( $text, $startpos, $length );
}

sub block_wrap_text {
    my ( $ctx, $args ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $text = $builder->build( $ctx, $tokens ) )
      or return $ctx->error( $builder->errstr );
    my $cols = $args->{'cols'} || 72;
    return MT::I18N::wrap_text( $text, $cols );
}

sub block_length_text {
    my ( $ctx, $args ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $text = $builder->build( $ctx, $tokens ) )
      or return $ctx->error( $builder->errstr );
    return MT::I18N::length_text($text);
}

sub block_first_n_text {
    my ( $ctx, $args ) = @_;
    my $builder = $ctx->stash('builder');
    my $tokens  = $ctx->stash('tokens');
    defined( my $text = $builder->build( $ctx, $tokens ) )
      or return $ctx->error( $builder->errstr );
    my $length = $args->{'length'} || 20;
    return ( MT::I18N::length_text($text) > $length )
      ? MT::I18N::first_n_text( $text, $length ) . '...'
      : $text;
}

sub modifier_first_n_text {
    my ( $text, $length, $ctx ) = @_;
    $length ||= 20;
    return ( MT::I18N::length_text($text) > $length )
      ? MT::I18N::first_n_text( $text, $length ) . '...'
      : $text;
}

1;
