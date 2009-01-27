# I18N Helper plugin
#
# $Id$
# This software is provided as-is. You may use it for commercial or
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2009 Hirotaka Ogawa

package MT::Plugin::I18NHelper;
use strict;
use base qw( MT::Plugin );

use MT;

our $VERSION = '0.10';

my $plugin = __PACKAGE__->new(
    {
        id          => 'i18n_helper',
        name        => 'I18N Helper',
        description => 'MT::I18N block tags and modifiers.',
        doc_link    => 'http://code.as-is.net/public/wiki/I18NHelper',
        author_name => 'Hirotaka Ogawa',
        author_link => 'http://as-is.net/blog/',
        version     => $VERSION,
    }
);
MT->add_plugin($plugin);

sub instance { $plugin }

sub init_registry {
    my $plugin = shift;
    my $pkg    = 'I18NHelper::';
    $plugin->registry(
        {
            tags => {
                block => {
                    GuessEncoding => $pkg . 'block_guess_encoding',
                    EncodeText    => $pkg . 'block_encode_text',
                    SubstrText    => $pkg . 'block_substr_text',
                    WrapText      => $pkg . 'block_wrap_text',
                    LengthText    => $pkg . 'block_length_text',
                    FirstNText    => $pkg . 'block_first_n_text',
                },
                function => {},
                modifier => { first_n_text => $pkg . 'modifier_first_n_text', },
            },
        }
    );
}

1;
