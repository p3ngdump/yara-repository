rule win_alice_atm_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.alice_atm."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.alice_atm"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 53 ff13 ff35???????? 68ec030000 ff7508 e8???????? 6a10 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   ff13                 | call                dword ptr [ebx]
            //   ff35????????         |                     
            //   68ec030000           | push                0x3ec
            //   ff7508               | push                dword ptr [ebp + 8]
            //   e8????????           |                     
            //   6a10                 | push                0x10

        $sequence_1 = { 837d0800 7442 8b5d08 8d75dc }
            // n = 4, score = 100
            //   837d0800             | cmp                 dword ptr [ebp + 8], 0
            //   7442                 | je                  0x44
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   8d75dc               | lea                 esi, [ebp - 0x24]

        $sequence_2 = { 50 e8???????? 8b4df8 66894e07 c1e102 }
            // n = 5, score = 100
            //   50                   | push                eax
            //   e8????????           |                     
            //   8b4df8               | mov                 ecx, dword ptr [ebp - 8]
            //   66894e07             | mov                 word ptr [esi + 7], cx
            //   c1e102               | shl                 ecx, 2

        $sequence_3 = { 83c710 83c604 4b 75d4 ff75f8 e8???????? }
            // n = 6, score = 100
            //   83c710               | add                 edi, 0x10
            //   83c604               | add                 esi, 4
            //   4b                   | dec                 ebx
            //   75d4                 | jne                 0xffffffd6
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   e8????????           |                     

        $sequence_4 = { 8bec 83c4f4 53 56 57 33ff 897dfc }
            // n = 7, score = 100
            //   8bec                 | mov                 ebp, esp
            //   83c4f4               | add                 esp, -0xc
            //   53                   | push                ebx
            //   56                   | push                esi
            //   57                   | push                edi
            //   33ff                 | xor                 edi, edi
            //   897dfc               | mov                 dword ptr [ebp - 4], edi

        $sequence_5 = { ba14000000 8b4d10 49 52 8f0488 c7430601000000 }
            // n = 6, score = 100
            //   ba14000000           | mov                 edx, 0x14
            //   8b4d10               | mov                 ecx, dword ptr [ebp + 0x10]
            //   49                   | dec                 ecx
            //   52                   | push                edx
            //   8f0488               | pop                 dword ptr [eax + ecx*4]
            //   c7430601000000       | mov                 dword ptr [ebx + 6], 1

        $sequence_6 = { 0bc0 747e 8b5d0c 0bdb 750b 6a28 6a40 }
            // n = 7, score = 100
            //   0bc0                 | or                  eax, eax
            //   747e                 | je                  0x80
            //   8b5d0c               | mov                 ebx, dword ptr [ebp + 0xc]
            //   0bdb                 | or                  ebx, ebx
            //   750b                 | jne                 0xd
            //   6a28                 | push                0x28
            //   6a40                 | push                0x40

        $sequence_7 = { 897df4 897de8 897de4 897de0 817d0c10010000 0f85b7000000 e8???????? }
            // n = 7, score = 100
            //   897df4               | mov                 dword ptr [ebp - 0xc], edi
            //   897de8               | mov                 dword ptr [ebp - 0x18], edi
            //   897de4               | mov                 dword ptr [ebp - 0x1c], edi
            //   897de0               | mov                 dword ptr [ebp - 0x20], edi
            //   817d0c10010000       | cmp                 dword ptr [ebp + 0xc], 0x110
            //   0f85b7000000         | jne                 0xbd
            //   e8????????           |                     

        $sequence_8 = { 6a00 6804100000 ff7320 e8???????? 8945fc }
            // n = 5, score = 100
            //   6a00                 | push                0
            //   6804100000           | push                0x1004
            //   ff7320               | push                dword ptr [ebx + 0x20]
            //   e8????????           |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax

        $sequence_9 = { 750b 6a28 6a40 e8???????? 8bd8 6a28 }
            // n = 6, score = 100
            //   750b                 | jne                 0xd
            //   6a28                 | push                0x28
            //   6a40                 | push                0x40
            //   e8????????           |                     
            //   8bd8                 | mov                 ebx, eax
            //   6a28                 | push                0x28

    condition:
        7 of them and filesize < 49152
}