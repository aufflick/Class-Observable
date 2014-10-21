package Song;

# $Id: Song.pm,v 1.1 2002/05/26 17:22:39 cwinters Exp $

use strict;
use base qw( Class::Observable );

sub new {
    my ( $class, $band, $name ) = @_;
    my $self = bless( {}, $class );
    $self->{band} = $band;
    $self->{name} = $name;
    return $self;
}

sub play {
    my ( $self ) = @_;
    $self->notify_observers( 'start_play' );
    #print "Playing [$self->{name}] by [$self->{band}]\n";
    $self->stop;
}

sub stop {
    my ( $self ) = @_;
    #print "Stopped [$self->{name}] by [$self->{band}]\n";
    $self->notify_observers( 'stop_play' );
}

1;
