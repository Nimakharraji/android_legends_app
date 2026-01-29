import '../models/hero_model.dart';
import '../../core/constants/enums.dart';

class HeroRepository {
  static final List<HeroModel> allHeroes = [
    // 1. Fanny
    _h(
        'fanny',
        1,
        'Fanny',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase/Reap',
        'High mobility wall-spam master.',
        'Wait for enemy CC, then dive.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 4,
            mobility: 10,
            difficulty: 9.5),
        55,
        c: ['khufra', 'saber', 'eudora', 'franco', 'chou', 'nana'],
        s: ['layla', 'miya', 'eudora', 'hanabi']),

    // 2. Layla
    _h(
        'layla',
        2,
        'Layla',
        HeroRole.marksman,
        [HeroLane.gold],
        'Range',
        'Extreme late-game damage.',
        'Stay behind tanks; maximize range.',
        const HeroStats(
            damage: 9.5,
            durability: 1.5,
            crowdControl: 3,
            mobility: 1,
            difficulty: 2),
        48,
        c: [
          'fanny',
          'ling',
          'lancelot',
          'gusion',
          'khufra',
          'saber',
          'jawhead'
        ],
        s: ['balmond', 'tigreal', 'estes']),

    // 3. Tigreal
    _h(
        'tigreal',
        3,
        'Tigreal',
        HeroRole.tank,
        [HeroLane.roam],
        'Control',
        'King of team initiation.',
        'Flicker + Ult combo for huge setups.',
        const HeroStats(
            damage: 3,
            durability: 9.5,
            crowdControl: 10,
            mobility: 4,
            difficulty: 3),
        52,
        c: ['diggie', 'valir', 'akai', 'lunox'],
        s: ['odette', 'pharsa', 'guinevere']),

    // 4. Gusion
    _h(
        'gusion',
        4,
        'Gusion',
        HeroRole.assassin,
        [HeroLane.jungle, HeroLane.mid],
        'Burst',
        'Magic assassin.',
        'Target the enemy marksman. Fast combo.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 2,
            mobility: 9,
            difficulty: 8.5),
        53,
        c: ['ruby', 'khufra', 'minisitthar', 'chou', 'nana'],
        s: ['layla', 'lesley', 'miya', 'eudora']),

    // 5. Nana
    _h(
        'nana',
        5,
        'Nana',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Poke',
        'The Molina disruptor.',
        'Place Molina in bushes; Ult in crowds.',
        const HeroStats(
            damage: 7.5,
            durability: 4,
            crowdControl: 9,
            mobility: 5,
            difficulty: 3),
        50,
        c: ['helcurt', 'natalia', 'saber', 'ling'],
        s: ['fanny', 'ling', 'gusion', 'chou']),

    // 6. Alucard
    _h(
        'alucard',
        6,
        'Alucard',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Lifesteal',
        'King of lifesteal.',
        'Wait for CC use before jumping in.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 2,
            mobility: 7.5,
            difficulty: 4),
        49,
        c: ['baxia', 'karrie', 'franco', 'khufra'],
        s: ['sun', 'gord', 'layla']),

    // 7. Franco
    _h(
        'franco',
        7,
        'Franco',
        HeroRole.tank,
        [HeroLane.roam],
        'Hook',
        'Hook expert.',
        'Hook the core and Suppress immediately.',
        const HeroStats(
            damage: 3,
            durability: 8,
            crowdControl: 10,
            mobility: 5,
            difficulty: 7),
        51,
        c: ['selena', 'kadita', 'hylos', 'diggie'],
        s: ['fanny', 'ling', 'gusion', 'lancelot']),

    // 8. Estes
    _h(
        'estes',
        8,
        'Estes',
        HeroRole.support,
        [HeroLane.roam],
        'Heal',
        'Ultimate healer.',
        'Stay in the middle of your team.',
        const HeroStats(
            damage: 1,
            durability: 5,
            crowdControl: 4,
            mobility: 3,
            difficulty: 3.5),
        54,
        c: ['luoyi', 'baxia', 'atlas', 'khaleed'],
        s: ['rafaela', 'angela', 'nana']),

    // 9. Chou
    _h(
        'chou',
        9,
        'Chou',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Control',
        'Kung-fu master.',
        'Kick the carry toward your team.',
        const HeroStats(
            damage: 7,
            durability: 7.5,
            crowdControl: 8.5,
            mobility: 9.5,
            difficulty: 8),
        52,
        c: ['masha', 'phoveus', 'khufra', 'nana'],
        s: ['lancelot', 'fanny', 'gusion', 'selena']),

    // 10. Ling
    _h(
        'ling',
        10,
        'Ling',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase',
        'Wall walker.',
        'Dive in when the enemy is low on HP.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 3.5,
            mobility: 10,
            difficulty: 8.5),
        53,
        c: ['kaja', 'khufra', 'saber', 'franco', 'eudora', 'nana'],
        s: ['layla', 'hanabi', 'miya']),

    // 11. Balmond
    _h(
        'balmond',
        11,
        'Balmond',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Regen',
        'Durable executioner.',
        'Spin in crowd. Use Ult for secure.',
        const HeroStats(
            damage: 7.5,
            durability: 8.5,
            crowdControl: 3,
            mobility: 5,
            difficulty: 3),
        51,
        c: ['karrie', 'valir', 'lunox', 'baxia'],
        s: ['layla', 'miya', 'hanabi']),

    // 12. Eudora
    _h(
        'eudora',
        12,
        'Eudora',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst',
        'Instant burst queen.',
        'Hide in bushes. Skill 2 -> Ult -> Skill 1.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 8,
            mobility: 3,
            difficulty: 3.5),
        50,
        c: ['lancelot', 'benedetta', 'chou', 'ling'],
        s: ['fanny', 'ling', 'gord', 'layla']),

    // 13. Khufra
    _h(
        'khufra',
        13,
        'Khufra',
        HeroRole.tank,
        [HeroLane.roam],
        'Anti-Dash',
        'The dash stopper.',
        'S1 from bush. S2 to stop dashers.',
        const HeroStats(
            damage: 4,
            durability: 9,
            crowdControl: 10,
            mobility: 7,
            difficulty: 7.5),
        53,
        c: ['valir', 'nana', 'diggie', 'karrie'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'layla']),

    // 14. Miya
    _h(
        'miya',
        14,
        'Miya',
        HeroRole.marksman,
        [HeroLane.gold],
        'Speed',
        'Late-game carry.',
        'Use Ult to reposition and surprise.',
        const HeroStats(
            damage: 9,
            durability: 2.5,
            crowdControl: 4,
            mobility: 7,
            difficulty: 3),
        49,
        c: ['hayabusa', 'saber', 'eudora', 'ling', 'fanny'],
        s: ['tigreal', 'estes', 'balmond']),

    // 15. Lancelot
    _h(
        'lancelot',
        15,
        'Lancelot',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase',
        'Invincibility frames.',
        'Dash through targets to reset S1.',
        const HeroStats(
            damage: 9,
            durability: 3.5,
            crowdControl: 2,
            mobility: 10,
            difficulty: 8),
        52,
        c: ['khufra', 'minisitthar', 'phoveus', 'ruby'],
        s: ['layla', 'eudora', 'odette', 'nana']),

    // 16. Valir
    _h(
        'valir',
        16,
        'Valir',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Guard',
        'Anti-tank mage.',
        'S2 to push back. Spam S1 to reset.',
        const HeroStats(
            damage: 8,
            durability: 4,
            crowdControl: 9,
            mobility: 4,
            difficulty: 4.5),
        51,
        c: ['lancelot', 'gusion', 'lesley', 'ling'],
        s: ['tigreal', 'balmond', 'khufra', 'hylos']),

    // 17. Karrie
    _h(
        'karrie',
        17,
        'Karrie',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.jungle],
        'True DMG',
        'Tank killer.',
        'Focus nearest target. Kite with dash.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 2,
            mobility: 8,
            difficulty: 6.5),
        54,
        c: ['lolita', 'natalia', 'saber', 'eudora'],
        s: ['tigreal', 'hylos', 'balmond', 'baxia', 'alucard']),

    // 18. Selena
    _h(
        'selena',
        18,
        'Selena',
        HeroRole.assassin,
        [HeroLane.mid, HeroLane.roam],
        'Stun',
        'Long-range stun.',
        'Arrow from afar. Traps for vision.',
        const HeroStats(
            damage: 9,
            durability: 2.5,
            crowdControl: 10,
            mobility: 8.5,
            difficulty: 8.5),
        50,
        c: ['kagura', 'wanwan', 'diggie', 'chou'],
        s: ['layla', 'gord', 'estes', 'franco']),

    // 19. Jawhead
    _h(
        'jawhead',
        19,
        'Jawhead',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Throw',
        'Pick-off master.',
        'Throw back to team.',
        const HeroStats(
            damage: 8.5,
            durability: 7.5,
            crowdControl: 8,
            mobility: 7.5,
            difficulty: 5),
        51,
        c: ['nana', 'karrie', 'valir', 'tigreal'],
        s: ['layla', 'hanabi', 'gord', 'eudora']),

    // 20. Granger
    _h(
        'granger',
        20,
        'Granger',
        HeroRole.marksman,
        [HeroLane.jungle, HeroLane.gold],
        'Burst',
        'Bullet burst.',
        'Poke with S1. Finish with Ult range.',
        const HeroStats(
            damage: 9.5,
            durability: 3.5,
            crowdControl: 2,
            mobility: 7,
            difficulty: 5.5),
        52,
        c: ['chou', 'saber', 'ling', 'fanny', 'lancelot'],
        s: ['balmond', 'layla', 'estes', 'nana']),

    // 21. Hayabusa
    _h(
        'hayabusa',
        21,
        'Hayabusa',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Chase',
        'Shadow-based ninja assassin.',
        'Use shadows to poke. Ultimate executes lone targets.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 3,
            mobility: 10,
            difficulty: 8.5),
        52,
        c: ['saber', 'eudora', 'khufra', 'franco', 'chou', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 22. Atlas
    _h(
        'atlas',
        22,
        'Atlas',
        HeroRole.tank,
        [HeroLane.roam],
        'Initiator/Control',
        'High-impact teamfight initiator.',
        'Eject and Flicker for massive group stuns.',
        const HeroStats(
            damage: 4,
            durability: 9.5,
            crowdControl: 10,
            mobility: 6,
            difficulty: 6),
        53,
        c: ['diggie', 'valir', 'nana', 'akai', 'chou'],
        s: ['odette', 'pharsa', 'estes', 'layla', 'miya']),

    // 23. Guinevere
    _h(
        'guinevere',
        23,
        'Guinevere',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Magic',
        'Magic fighter with heavy crowd control.',
        'Jump in for knock-up, then follow with Ultimate.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 9,
            mobility: 7.5,
            difficulty: 6.5),
        51,
        c: ['helcurt', 'chou', 'franco', 'khufra', 'ruby'],
        s: ['layla', 'miya', 'lesley', 'estes', 'nana']),

    // 24. Lesley
    _h(
        'lesley',
        24,
        'Lesley',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Poke',
        'Late-game sniper with true damage.',
        'Stay invisible. Use passive for massive single hits.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 3,
            mobility: 6,
            difficulty: 3.5),
        50,
        c: ['saber', 'lancelot', 'ling', 'fanny', 'hayabusa', 'gusion'],
        s: ['balmond', 'tigreal', 'hylos', 'valir']),

    // 25. Helcurt
    _h(
        'helcurt',
        25,
        'Helcurt',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Silence/Burst',
        'Disruptor who silences enemies.',
        'Use Ultimate to blind enemies. Teleport and burst.',
        const HeroStats(
            damage: 9.5,
            durability: 4,
            crowdControl: 8,
            mobility: 9,
            difficulty: 7.5),
        53,
        c: ['eudora', 'aurora', 'nana', 'khufra', 'akai'],
        s: ['fanny', 'ling', 'gusion', 'selena', 'eudora', 'odette']),

    // 26. Pharsa
    _h(
        'pharsa',
        26,
        'Pharsa',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Long-range air support mage.',
        'Position Ultimate carefully. Use bird form to escape.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 7,
            mobility: 8,
            difficulty: 6),
        51,
        c: ['chou', 'helcurt', 'saber', 'ling', 'lancelot', 'fanny'],
        s: ['estes', 'tigreal', 'layla', 'miya', 'nana']),

    // 27. Badang
    _h(
        'badang',
        27,
        'Badang',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Control',
        'Wall-punching crowd controller.',
        'Trap enemies with walls. Ultimate for multi-stun.',
        const HeroStats(
            damage: 8,
            durability: 7.5,
            crowdControl: 9.5,
            mobility: 6.5,
            difficulty: 5),
        50,
        c: ['terizla', 'valir', 'khufra', 'lunox', 'karrie'],
        s: ['layla', 'miya', 'hanabi', 'gord', 'odette']),

    // 28. Lolita
    _h(
        'lolita',
        28,
        'Lolita',
        HeroRole.support,
        [HeroLane.roam],
        'Guard/Control',
        'The ultimate projectile blocker.',
        'Use shield to block bullets. Charge Ultimate in bush.',
        const HeroStats(
            damage: 3,
            durability: 9,
            crowdControl: 9.5,
            mobility: 6,
            difficulty: 5.5),
        54,
        c: ['lunox', 'valir', 'akai', 'chou', 'diggie'],
        s: ['chang\'e', 'lesley', 'layla', 'miya', 'cyclops', 'eudora']),

    // 29. Wanwan
    _h(
        'wanwan',
        29,
        'Wanwan',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'Agile marksman who hops between hits.',
        'Hit all weaknesses to unlock your Ultimate.',
        const HeroStats(
            damage: 9,
            durability: 3,
            crowdControl: 5,
            mobility: 10,
            difficulty: 9),
        52,
        c: ['khufra', 'phoveus', 'minsitthar', 'franco', 'kaja', 'saber'],
        s: ['tigreal', 'balmond', 'estes', 'hylos', 'franco']),

    // 30. Akai
    _h(
        'akai',
        30,
        'Akai',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.jungle],
        'Control/Initiator',
        'The spinning panda disruptor.',
        'Pin enemies to walls with Heavy Spin.',
        const HeroStats(
            damage: 4.5,
            durability: 9,
            crowdControl: 10,
            mobility: 7,
            difficulty: 6.5),
        51,
        c: ['valir', 'diggie', 'nana', 'karrie', 'lunox'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'chou']),
    // 31. Cecilion
    _h(
        'cecilion',
        31,
        'Cecilion',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Late-game magic powerhouse with infinite mana scaling.',
        'Maintain distance. Spam Skill 1 to collect stacks for massive late-game damage.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 5,
            mobility: 4,
            difficulty: 4.5),
        52,
        c: ['helcurt', 'natalia', 'saber', 'ling', 'lancelot', 'gusion'],
        s: ['estes', 'tigreal', 'hylos', 'layla', 'miya']),

    // 32. Carmilla
    _h(
        'carmilla',
        32,
        'Carmilla',
        HeroRole.support,
        [HeroLane.roam],
        'Control/Guard',
        'Support that links enemies to share damage and CC.',
        'Use Ultimate to link as many enemies as possible before your team uses burst skills.',
        const HeroStats(
            damage: 5,
            durability: 8,
            crowdControl: 9,
            mobility: 7,
            difficulty: 5),
        51,
        c: ['valir', 'karrie', 'lunox', 'baxia', 'akai'],
        s: ['estes', 'angela', 'tigreal', 'balmond']),

    // 33. Khaleed
    _h(
        'khaleed',
        33,
        'Khaleed',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Regen',
        'Early-game lane bully with high sustain.',
        'Use Skill 1 to poke and clear waves. Use Skill 2 in bushes to bait enemy skills.',
        const HeroStats(
            damage: 8.5,
            durability: 8.5,
            crowdControl: 6,
            mobility: 8,
            difficulty: 4),
        50,
        c: ['franco', 'chou', 'nana', 'jawhead', 'khufra'],
        s: ['layla', 'miya', 'hanabi', 'gord', 'sun']),

    // 34. Brody
    _h(
        'brody',
        34,
        'Brody',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'Physical burst marksman with high mobility while attacking.',
        'Stack marks on enemies before using your Ultimate for a guaranteed execution.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 5,
            mobility: 7.5,
            difficulty: 6),
        53,
        c: ['saber', 'hayabusa', 'ling', 'lancelot', 'eudora', 'natalia'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'karrie']),

    // 35. Benedetta
    _h(
        'benedetta',
        35,
        'Benedetta',
        HeroRole.assassin,
        [HeroLane.exp, HeroLane.jungle],
        'Chase/Burst',
        'High mobility assassin who relies on charged dashes.',
        'Master your passive dash. Use Skill 2 to block and counter enemy crowd control.',
        const HeroStats(
            damage: 9,
            durability: 5,
            crowdControl: 6,
            mobility: 10,
            difficulty: 9),
        52,
        c: ['khufra', 'minsitthar', 'phoveus', 'franco', 'kaja', 'nana'],
        s: ['layla', 'miya', 'eudora', 'pharsa', 'estes']),

    // 36. Paquito
    _h(
        'paquito',
        36,
        'Paquito',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Chase',
        'Combo-based fighter with high burst and low cooldowns.',
        'Always maintain 2 stacks before entering a fight to trigger your enhanced skills.',
        const HeroStats(
            damage: 9.5,
            durability: 7,
            crowdControl: 7,
            mobility: 9,
            difficulty: 8),
        54,
        c: ['esmeralda', 'alice', 'barats', 'khufra', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gusion']),

    // 37. Beatrix
    _h(
        'beatrix',
        37,
        'Beatrix',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Range',
        'Versatile marksman with 4 different weapon modes.',
        'Switch weapons based on the situation: Sniper for poke, Shotgun for close range.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 2,
            mobility: 7,
            difficulty: 8.5),
        51,
        c: ['saber', 'hayabusa', 'ling', 'lancelot', 'natalia', 'gusion'],
        s: ['tigreal', 'balmond', 'estes', 'miya', 'layla']),

    // 38. Yve
    _h(
        'yve',
        38,
        'Yve',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Manipulation mage with a massive chessboard Ultimate.',
        'Place your Ultimate in a safe spot. Tap and slide to slow and damage enemies.',
        const HeroStats(
            damage: 9,
            durability: 3,
            crowdControl: 9,
            mobility: 5,
            difficulty: 7),
        50,
        c: ['kaja', 'franco', 'saber', 'ling', 'lancelot', 'fanny', 'chou'],
        s: ['estes', 'tigreal', 'layla', 'miya', 'gord']),

    // 39. Gloo
    _h(
        'gloo',
        39,
        'Gloo',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.exp],
        'Control/Sustain',
        'Disruptive tank that attaches to enemies.',
        'Stack passives on enemies. Use Ultimate to attach to the enemy core and drag them out.',
        const HeroStats(
            damage: 5,
            durability: 9,
            crowdControl: 9,
            mobility: 7,
            difficulty: 6),
        52,
        c: ['faramis', 'vexana', 'valir', 'karrie', 'lunox'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'estes']),

    // 40. Edith
    _h(
        'edith',
        40,
        'Edith',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.exp],
        'Control/Burst',
        'Hybrid tank/marksman who converts defense to magic damage.',
        'Absorb damage in tank form to gain Wrath, then use Ultimate to burst enemies down.',
        const HeroStats(
            damage: 8.5,
            durability: 9.5,
            crowdControl: 8,
            mobility: 6,
            difficulty: 6.5),
        53,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'akai'],
        s: ['layla', 'miya', 'fanny', 'ling', 'lancelot']),

    // 41. Aamon
    _h(
        'aamon',
        41,
        'Aamon',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Magic',
        'Cunning assassin who uses camouflage to strike.',
        'Use skills to trigger camouflage. Accumulate shards for a massive Ultimate execute.',
        const HeroStats(
            damage: 10,
            durability: 3.5,
            crowdControl: 3,
            mobility: 8.5,
            difficulty: 7),
        53,
        c: ['eudora', 'saber', 'khufra', 'franco', 'chou'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 42. Valentina
    _h(
        'valentina',
        42,
        'Valentina',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Copy/Burst',
        'Mage who steals enemy ultimates to use against them.',
        'S1 and S2 combo for fear CC. Save Ultimate to steal high-impact enemy teamfight skills.',
        const HeroStats(
            damage: 9,
            durability: 5,
            crowdControl: 8,
            mobility: 7.5,
            difficulty: 8.5),
        54,
        c: ['helcurt', 'hayabusa', 'ling', 'chou', 'nana'],
        s: ['estes', 'tigreal', 'atlas', 'odette', 'pharsa']),

    // 43. Yin
    _h(
        'yin',
        43,
        'Yin',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Control',
        'Duel master who traps enemies in his own dimension.',
        'Kidnap the enemy marksman or mage into your domain to secure a kill.',
        const HeroStats(
            damage: 9,
            durability: 6.5,
            crowdControl: 8,
            mobility: 8,
            difficulty: 6),
        51,
        c: ['khufra', 'valir', 'akai', 'edith', 'nana'],
        s: ['layla', 'miya', 'hanabi', 'lesley', 'estes']),

    // 44. Melissa
    _h(
        'melissa',
        44,
        'Melissa',
        HeroRole.marksman,
        [HeroLane.gold],
        'Reap/Damage',
        'Anti-assassin marksman with a protective barrier.',
        'Use Skill 2 to poke. Activate Ultimate to stay safe from melee attackers.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 6,
            mobility: 7.5,
            difficulty: 7),
        53,
        c: ['franco', 'saber', 'eudora', 'lesley', 'kadita'],
        s: ['alucard', 'chou', 'balmond', 'tigreal', 'akai']),

    // 45. Xavier
    _h(
        'xavier',
        45,
        'Xavier',
        HeroRole.mage,
        [HeroLane.mid],
        'Damage/Guard',
        'Long-range artillery mage with high CC potential.',
        'Spam S1 and S2 for stuns. Use Ult for global snipes on low-HP enemies.',
        const HeroStats(
            damage: 10,
            durability: 2.5,
            crowdControl: 9,
            mobility: 4,
            difficulty: 6.5),
        52,
        c: ['fanny', 'ling', 'helcurt', 'natalia', 'gusion'],
        s: ['estes', 'tigreal', 'hylos', 'layla', 'miya']),

    // 46. Julian
    _h(
        'julian',
        46,
        'Julian',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp, HeroLane.mid],
        'Chase/Magic Burst',
        'Versatile hero with multiple enhanced skill paths.',
        'No Ultimate; your third skill is always enhanced. Choose the combo your team needs.',
        const HeroStats(
            damage: 9.5,
            durability: 6,
            crowdControl: 8.5,
            mobility: 7,
            difficulty: 8),
        54,
        c: ['chou', 'franco', 'kaja', 'valir', 'khufra'],
        s: ['layla', 'lesley', 'miya', 'eudora', 'estes']),

    // 47. Fredrinn
    _h(
        'fredrinn',
        47,
        'Fredrinn',
        HeroRole.tank,
        [HeroLane.jungle, HeroLane.exp],
        'Damage/Regen',
        'Durable tank who converts damage taken into powerful attacks.',
        'Taunt enemies and absorb damage. Use Ultimate for a massive area execution.',
        const HeroStats(
            damage: 7,
            durability: 10,
            crowdControl: 9,
            mobility: 5,
            difficulty: 6),
        55,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'hayabusa']),

    // 48. Joy
    _h(
        'joy',
        48,
        'Joy',
        HeroRole.assassin,
        [HeroLane.jungle, HeroLane.exp],
        'Chase/Damage',
        'Rhythmic assassin with incredible dash sustain.',
        'Dash on the beat to gain shields and unlock the power of your Ultimate.',
        const HeroStats(
            damage: 9,
            durability: 5.5,
            crowdControl: 4,
            mobility: 10,
            difficulty: 9.5),
        53,
        c: ['kaja', 'franco', 'minsitthar', 'phoveus', 'khufra'],
        s: ['layla', 'miya', 'hanabi', 'estes', 'pharsa']),

    // 49. Arlott
    _h(
        'arlott',
        49,
        'Arlott',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Burst/Control',
        'High-speed dasher who capitalizes on enemy displacement.',
        'Wait for marks to appear, then chain Skill 2 dashes for infinite mobility.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 9.5,
            mobility: 9,
            difficulty: 8),
        52,
        c: ['khufra', 'phoveus', 'minsitthar', 'nana', 'akai'],
        s: ['layla', 'miya', 'lesley', 'eudora', 'estes']),

    // 50. Novaria
    _h(
        'novaria',
        50,
        'Novaria',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Sniper mage who provides vision and long-range damage.',
        'Use Ultimate to mark enemy hitboxes. Snipe from afar with Skill 2.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 5,
            mobility: 8.5,
            difficulty: 7.5),
        51,
        c: ['ling', 'fanny', 'helcurt', 'saber', 'lancelot'],
        s: ['estes', 'tigreal', 'layla', 'miya', 'nana']),

    // 51. Ixia
    _h(
        'ixia',
        51,
        'Ixia',
        HeroRole.marksman,
        [HeroLane.gold],
        'Reap/Damage',
        'High-ground marksman with a massive fan-shaped Ultimate.',
        'Position yourself safely before using Ultimate to dominate teamfights.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 5.5,
            mobility: 4.5,
            difficulty: 6),
        51,
        c: ['saber', 'ling', 'fanny', 'eudora', 'chou', 'gusion'],
        s: ['tigreal', 'estes', 'balmond', 'miya', 'layla']),

    // 52. Nolan
    _h(
        'nolan',
        52,
        'Nolan',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase/Burst',
        'Rift-cutting assassin with ultra-fast skill rotations.',
        'Create rift intersections for explosions. Use Ult to cleanse CC and escape.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 3,
            mobility: 10,
            difficulty: 8.5),
        54,
        c: ['khufra', 'franco', 'kaja', 'saber', 'eudora'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 53. Cici
    _h(
        'cici',
        53,
        'Cici',
        HeroRole.fighter,
        [HeroLane.exp],
        'Damage/Regen',
        'Yo-yo wielding fighter who kites enemies with high speed.',
        'Maintain distance while Skill 1 is active to melt enemy HP while moving.',
        const HeroStats(
            damage: 8,
            durability: 8,
            crowdControl: 4,
            mobility: 9,
            difficulty: 5),
        52,
        c: ['saber', 'eudora', 'chou', 'franco', 'khufra'],
        s: ['balmond', 'tigreal', 'hylos', 'layla', 'miya']),

    // 54. Terizla
    _h(
        'terizla',
        54,
        'Terizla',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Control',
        'Slow but heavy hitter with extreme damage reduction.',
        'Use Ultimate to pull enemies together, then follow with heavy Skill 2 hits.',
        const HeroStats(
            damage: 9.5,
            durability: 9.5,
            crowdControl: 8,
            mobility: 3,
            difficulty: 4.5),
        53,
        c: ['valir', 'lunox', 'karrie', 'baxia', 'wanwan'],
        s: ['chou', 'badang', 'alucard', 'paquito', 'yin']),

    // 55. Esmeralda
    _h(
        'esmeralda',
        55,
        'Esmeralda',
        HeroRole.mage,
        [HeroLane.exp, HeroLane.mid],
        'Regen/Mixed Damage',
        'Shield-absorbing battle mage who thrives in prolonged fights.',
        'Spam Skill 1 and 2 to constantly steal enemy shields and boost speed.',
        const HeroStats(
            damage: 7.5,
            durability: 9,
            crowdControl: 4,
            mobility: 8,
            difficulty: 6.5),
        52,
        c: ['baxia', 'karrie', 'dyrroth', 'lunox', 'franco'],
        s: ['pharsa', 'odette', 'estes', 'angela', 'lolita']),

    // 56. Martis
    _h(
        'martis',
        56,
        'Martis',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Burst/Control',
        'Unstoppable fighter with CC immunity during Skill 2.',
        'Use Skill 2 to block CC. Use Ultimate to execute and reset CD for a savage.',
        const HeroStats(
            damage: 9,
            durability: 7.5,
            crowdControl: 8,
            mobility: 7,
            difficulty: 5.5),
        54,
        c: ['franco', 'kaja', 'khufra', 'valir', 'baxia'],
        s: ['nana', 'layla', 'miya', 'estes', 'rafaela']),

    // 57. Lapu-Lapu
    _h(
        'lapulapu',
        57,
        'Lapu-Lapu',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Guard',
        'Heavy fighter with massive damage reduction in Twin Blade form.',
        'Engage with Ultimate to gain defense and massive AOE burst damage.',
        const HeroStats(
            damage: 8.5,
            durability: 9,
            crowdControl: 7,
            mobility: 7.5,
            difficulty: 6),
        52,
        c: ['esmeralda', 'karrie', 'valir', 'baxia', 'wanwan'],
        s: ['pharsa', 'layla', 'miya', 'lesley', 'hanabi']),

    // 58. Thamuz
    _h(
        'thamuz',
        58,
        'Thamuz',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Regen/True Damage',
        'Early-game lane bully with insane health regeneration.',
        'Spam scythes to slow enemies. Activate Ult for massive sustain in teamfights.',
        const HeroStats(
            damage: 8,
            durability: 9.5,
            crowdControl: 3,
            mobility: 6,
            difficulty: 4.5),
        51,
        c: ['baxia', 'valir', 'karrie', 'lunox', 'dyrroth'],
        s: ['balmond', 'sun', 'alucard', 'zilong', 'layla']),

    // 59. Lunox
    _h(
        'lunox',
        59,
        'Lunox',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.gold],
        'Burst/Poke',
        'Versatile mage who toggles between healing and heavy magic penetration.',
        'Use Brilliant version to escape or stay safe. Use Darkening to burst tanks.',
        const HeroStats(
            damage: 10,
            durability: 5,
            crowdControl: 4,
            mobility: 7,
            difficulty: 8.5),
        53,
        c: ['saber', 'ling', 'lancelot', 'helcurt', 'natalia'],
        s: ['hylos', 'tigreal', 'balmond', 'terizla', 'fredrinn']),

    // 60. Claude
    _h(
        'claude',
        60,
        'Claude',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.jungle],
        'Burst/Chase',
        'High mobility marksman who excels at diving teamfights.',
        'Keep stacks full with S1. Use S2 to dive with Ultimate and blink back safely.',
        const HeroStats(
            damage: 9,
            durability: 4,
            crowdControl: 2,
            mobility: 10,
            difficulty: 8),
        52,
        c: ['saber', 'masha', 'franco', 'kaja', 'khufra', 'eudora'],
        s: ['tigreal', 'estes', 'pharsa', 'layla', 'miya']),

    // 61. Yu Zhong
    _h(
        'yuzhong',
        61,
        'Yu Zhong',
        HeroRole.fighter,
        [HeroLane.exp],
        'Regen/Burst',
        'Black Dragon who dominates lane with life drain.',
        'Apply Sha Residue to 5 stacks to heal. Use Dragon form to dive the backline.',
        const HeroStats(
            damage: 8.5,
            durability: 9,
            crowdControl: 7.5,
            mobility: 7,
            difficulty: 7),
        53,
        c: ['baxia', 'karrie', 'lunox', 'dyrroth', 'valir'],
        s: ['terizla', 'lapulapu', 'balmond', 'layla', 'miya']),

    // 62. Phoveus
    _h(
        'phoveus',
        62,
        'Phoveus',
        HeroRole.fighter,
        [HeroLane.exp],
        'Chase/Control',
        'The ultimate counter to high-mobility dash heroes.',
        'Wait for enemies to dash, then spam your Ultimate to teleport and smash them.',
        const HeroStats(
            damage: 8,
            durability: 8.5,
            crowdControl: 7,
            mobility: 8,
            difficulty: 6),
        52,
        c: ['franco', 'kaja', 'esmeralda', 'lunox', 'karrie'],
        s: ['wanwan', 'benedetta', 'lancelot', 'fanny', 'joy', 'arlott']),

    // 63. Baxia
    _h(
        'baxia',
        63,
        'Baxia',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.jungle],
        'Guard/Initiator',
        'The living anti-heal machine with high mobility.',
        'Roll into enemies to initiate. Spam Skill 2 on high-regen targets to reduce their healing.',
        const HeroStats(
            damage: 5,
            durability: 9.5,
            crowdControl: 6,
            mobility: 9,
            difficulty: 4.5),
        54,
        c: ['karrie', 'lunox', 'valir', 'x.borg', 'dyrroth'],
        s: ['estes', 'esmeralda', 'alucard', 'thamuz', 'yuzhong', 'uranus']),

    // 64. Minsitthar
    _h(
        'minsitthar',
        64,
        'Minsitthar',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Control/Guard',
        'King of the battlefield who forbids enemy dashing.',
        'Hook enemies into your Ultimate. Enemies inside cannot use any blink or dash skills.',
        const HeroStats(
            damage: 7,
            durability: 8.5,
            crowdControl: 10,
            mobility: 4.5,
            difficulty: 6.5),
        53,
        c: ['helcurt', 'nana', 'diggie', 'valir', 'kadita'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'wanwan', 'joy']),

    // 65. Kadita
    _h(
        'kadita',
        65,
        'Kadita',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Burst/Chase',
        'Ocean goddess with high-burst magic and invincibility frames.',
        'Use S1 to dive, S2 for knock-up, and Ult for massive AOE burst. Use S1 to escape CC.',
        const HeroStats(
            damage: 10,
            durability: 4.5,
            crowdControl: 7.5,
            mobility: 8.5,
            difficulty: 7.5),
        54,
        c: ['kaja', 'franco', 'saber', 'helcurt', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'pharsa', 'ixia']),

    // 66. Harith
    _h(
        'harith',
        66,
        'Harith',
        HeroRole.mage,
        [HeroLane.gold, HeroLane.mid],
        'Burst/Chase',
        'Hyper-active mage who excels in continuous dashing and shielding.',
        'Stay inside your Ultimate field to spam Skill 2 dashes and Skill 1 bursts.',
        const HeroStats(
            damage: 9,
            durability: 6.5,
            crowdControl: 4.5,
            mobility: 10,
            difficulty: 8.5),
        52,
        c: ['phoveus', 'minsitthar', 'khufra', 'saber', 'eudora'],
        s: ['balmond', 'hylos', 'tigreal', 'alucard', 'dyrroth']),

    // 67. Moskov
    _h(
        'moskov',
        67,
        'Moskov',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'High attack-speed marksman who pins enemies to walls.',
        'Position yourself to pin enemies against walls for a long stun. Use passive to clear waves fast.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 6,
            mobility: 9.5,
            difficulty: 8),
        51,
        c: ['saber', 'eudora', 'lesley', 'hayabusa', 'ling', 'fanny'],
        s: ['tigreal', 'estes', 'balmond', 'layla', 'miya', 'hanabi']),

    // 68. Hanabi
    _h(
        'hanabi',
        68,
        'Hanabi',
        HeroRole.marksman,
        [HeroLane.gold],
        'Reap/Damage',
        'Crowd-control immune marksman with bouncing blades.',
        'Keep your shield active to remain immune to CC. Use Ultimate to link and root multiple enemies.',
        const HeroStats(
            damage: 8.5,
            durability: 5,
            crowdControl: 8,
            mobility: 3,
            difficulty: 3),
        50,
        c: ['fanny', 'ling', 'lancelot', 'gusion', 'saber', 'hayabusa'],
        s: ['tigreal', 'atlas', 'estes', 'nana', 'minotaur']),

    // 69. Zhask
    _h(
        'zhask',
        69,
        'Zhask',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Summoner from the swarm who fights through a giant turret.',
        'Summon Nightmaric Spawn. Use Ultimate to fuse with it for massive damage and defense.',
        const HeroStats(
            damage: 10,
            durability: 6,
            crowdControl: 7.5,
            mobility: 4,
            difficulty: 6),
        52,
        c: ['helcurt', 'natalia', 'ling', 'fanny', 'lancelot', 'hanzo'],
        s: ['layla', 'miya', 'estes', 'tigreal', 'balmond']),

    // 70. Argus
    _h(
        'argus',
        70,
        'Argus',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Regen',
        'Fallen angel who cannot be killed during his Ultimate.',
        'Activate Ultimate when low on HP. You are invincible and heal from the damage you deal.',
        const HeroStats(
            damage: 9.5,
            durability: 10, // During Ult
            crowdControl: 4,
            mobility: 7,
            difficulty: 5),
        49,
        c: ['valir', 'akai', 'nana', 'diggie', 'chou', 'jawhead'],
        s: ['layla', 'miya', 'hanabi', 'sun', 'gord', 'zilong']),
  ];

  static List<HeroModel> getAllHeroes() => allHeroes;

  static HeroModel? getHeroById(String id) {
    try {
      return allHeroes.firstWhere((hero) => hero.id == id);
    } catch (e) {
      return null;
    }
  }

  // متد کمکی با آدرس‌دهی خودکار به فرمت .webp
  static HeroModel _h(
      String id,
      int gId,
      String n,
      HeroRole r,
      List<HeroLane> l,
      String spec,
      String ai,
      String guide,
      HeroStats stats,
      int win,
      {List<String> c = const [],
      List<String> s = const []}) {
    return HeroModel(
      id: id,
      gameId: gId,
      name: n,
      role: r,
      preferredLanes: l,
      imagePath: 'assets/images/heroes/$id.webp', // اصلاح به فرمت webp
      specialty: spec,
      aiDescription: ai,
      teamfightGuide: guide,
      stats: stats,
      winProbabilityBase: win,
      counterHeroIds: c,
      strongAgainstHeroIds: s,
    );
  }
}
