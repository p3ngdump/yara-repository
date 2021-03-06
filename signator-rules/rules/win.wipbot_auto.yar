rule win_wipbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.wipbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.wipbot"
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
        $sequence_0 = { b88a758b1f e8???????? 85c0 7428 8d55ec 8954240c 8d55f0 }
            // n = 7, score = 100
            //   b88a758b1f           | mov                 eax, 0x1f8b758a
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7428                 | je                  0x2a
            //   8d55ec               | lea                 edx, [ebp - 0x14]
            //   8954240c             | mov                 dword ptr [esp + 0xc], edx
            //   8d55f0               | lea                 edx, [ebp - 0x10]

        $sequence_1 = { 8906 48 8d4328 48 8d5674 }
            // n = 5, score = 100
            //   8906                 | mov                 dword ptr [esi], eax
            //   48                   | dec                 eax
            //   8d4328               | lea                 eax, [ebx + 0x28]
            //   48                   | dec                 eax
            //   8d5674               | lea                 edx, [esi + 0x74]

        $sequence_2 = { 75f3 30c0 eb0b 41 8a1404 88540658 48 }
            // n = 7, score = 100
            //   75f3                 | jne                 0xfffffff5
            //   30c0                 | xor                 al, al
            //   eb0b                 | jmp                 0xd
            //   41                   | inc                 ecx
            //   8a1404               | mov                 dl, byte ptr [esp + eax]
            //   88540658             | mov                 byte ptr [esi + eax + 0x58], dl
            //   48                   | dec                 eax

        $sequence_3 = { 8954240c 8d55f0 89542408 c744240400000000 c7042400000000 ffd0 }
            // n = 6, score = 100
            //   8954240c             | mov                 dword ptr [esp + 0xc], edx
            //   8d55f0               | lea                 edx, [ebp - 0x10]
            //   89542408             | mov                 dword ptr [esp + 8], edx
            //   c744240400000000     | mov                 dword ptr [esp + 4], 0
            //   c7042400000000       | mov                 dword ptr [esp], 0
            //   ffd0                 | call                eax

        $sequence_4 = { c68424960000001e 48 8d44245c 88d1 48 01d0 48 }
            // n = 7, score = 100
            //   c68424960000001e     | mov                 byte ptr [esp + 0x96], 0x1e
            //   48                   | dec                 eax
            //   8d44245c             | lea                 eax, [esp + 0x5c]
            //   88d1                 | mov                 cl, dl
            //   48                   | dec                 eax
            //   01d0                 | add                 eax, edx
            //   48                   | dec                 eax

        $sequence_5 = { 53 83ec3c 8945d4 b8de3e4b5a 8955d0 ba6cf4af8f 894dcc }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   83ec3c               | sub                 esp, 0x3c
            //   8945d4               | mov                 dword ptr [ebp - 0x2c], eax
            //   b8de3e4b5a           | mov                 eax, 0x5a4b3ede
            //   8955d0               | mov                 dword ptr [ebp - 0x30], edx
            //   ba6cf4af8f           | mov                 edx, 0x8faff46c
            //   894dcc               | mov                 dword ptr [ebp - 0x34], ecx

        $sequence_6 = { 85c9 48 89cf 0f847f010000 48 8d4c2430 e8???????? }
            // n = 7, score = 100
            //   85c9                 | test                ecx, ecx
            //   48                   | dec                 eax
            //   89cf                 | mov                 edi, ecx
            //   0f847f010000         | je                  0x185
            //   48                   | dec                 eax
            //   8d4c2430             | lea                 ecx, [esp + 0x30]
            //   e8????????           |                     

        $sequence_7 = { 8a140f 42 881408 49 ffc1 }
            // n = 5, score = 100
            //   8a140f               | mov                 dl, byte ptr [edi + ecx]
            //   42                   | inc                 edx
            //   881408               | mov                 byte ptr [eax + ecx], dl
            //   49                   | dec                 ecx
            //   ffc1                 | inc                 ecx

        $sequence_8 = { 48 8b5c2440 31c0 48 8d4e58 4c 8d6b58 }
            // n = 7, score = 100
            //   48                   | dec                 eax
            //   8b5c2440             | mov                 ebx, dword ptr [esp + 0x40]
            //   31c0                 | xor                 eax, eax
            //   48                   | dec                 eax
            //   8d4e58               | lea                 ecx, [esi + 0x58]
            //   4c                   | dec                 esp
            //   8d6b58               | lea                 ebp, [ebx + 0x58]

        $sequence_9 = { 53 89cb e8???????? 85c0 7525 8b0b bf711427cb }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   89cb                 | mov                 ebx, ecx
            //   e8????????           |                     
            //   85c0                 | test                eax, eax
            //   7525                 | jne                 0x27
            //   8b0b                 | mov                 ecx, dword ptr [ebx]
            //   bf711427cb           | mov                 edi, 0xcb271471

    condition:
        7 of them and filesize < 253952
}