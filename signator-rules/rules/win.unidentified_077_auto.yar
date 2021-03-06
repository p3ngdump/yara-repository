rule win_unidentified_077_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.unidentified_077."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_077"
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
        $sequence_0 = { 488bd8 740e 483bc7 0f848d000000 e9???????? 4d8bbcf160130100 33d2 }
            // n = 7, score = 600
            //   488bd8               | mov                 eax, edi
            //   740e                 | dec                 ecx
            //   483bc7               | xchg                dword ptr [edi + esi*8 + 0x1c740], eax
            //   0f848d000000         | jmp                 0x7e
            //   e9????????           |                     
            //   4d8bbcf160130100     | xor                 ebx, ebx
            //   33d2                 | dec                 esp

        $sequence_1 = { 488bd5 33c9 488bf8 ff15???????? }
            // n = 4, score = 600
            //   488bd5               | lea                 edi, [0x1442b]
            //   33c9                 | je                  0x54d
            //   488bf8               | dec                 eax
            //   ff15????????         |                     

        $sequence_2 = { 4933d0 4a8794f1a0bf0100 eb2d 4c8b05???????? ebb1 b940000000 418bc0 }
            // n = 7, score = 600
            //   4933d0               | dec                 eax
            //   4a8794f1a0bf0100     | sub                 esp, 0x48
            //   eb2d                 | dec                 eax
            //   4c8b05????????       |                     
            //   ebb1                 | and                 dword ptr [esp + 0x30], 0
            //   b940000000           | dec                 eax
            //   418bc0               | lea                 ecx, [0x8a6f]

        $sequence_3 = { 4c897c2460 4e8d3c21 7515 b864860000 6641394704 7509 418b4f38 }
            // n = 7, score = 600
            //   4c897c2460           | dec                 eax
            //   4e8d3c21             | mov                 dword ptr [ebp - 0x29], eax
            //   7515                 | dec                 eax
            //   b864860000           | lea                 eax, [0xa29c]
            //   6641394704           | dec                 eax
            //   7509                 | mov                 dword ptr [ebp - 1], eax
            //   418b4f38             | dec                 eax

        $sequence_4 = { 498784f180bf0100 eb25 488bc3 498784f180bf0100 4885c0 }
            // n = 5, score = 600
            //   498784f180bf0100     | sub                 esp, 0x38
            //   eb25                 | dec                 eax
            //   488bc3               | lea                 eax, [0x9215]
            //   498784f180bf0100     | inc                 ecx
            //   4885c0               | mov                 ecx, 0x1b

        $sequence_5 = { 33ff 4c8bea 4c8be1 4883fa40 }
            // n = 4, score = 600
            //   33ff                 | xor                 eax, eax
            //   4c8bea               | inc                 ecx
            //   4c8be1               | movzx               eax, word ptr [edi + 0x14]
            //   4883fa40             | dec                 ecx

        $sequence_6 = { 0f84a3000000 8b7500 498b9cf740c70100 4885db 7407 483bdf }
            // n = 6, score = 600
            //   0f84a3000000         | dec                 eax
            //   8b7500               | and                 ebp, eax
            //   498b9cf740c70100     | dec                 eax
            //   4885db               | lea                 ecx, [esp + 0x20]
            //   7407                 | mov                 edx, dword ptr [esp + 0x24]
            //   483bdf               | inc                 ecx

        $sequence_7 = { 4885db 750d 488bc7 498784f180bf0100 eb25 488bc3 }
            // n = 6, score = 600
            //   4885db               | dec                 eax
            //   750d                 | shl                 esi, 2
            //   488bc7               | movzx               eax, word ptr [ecx + edi*4 + 0x14050]
            //   498784f180bf0100     | dec                 eax
            //   eb25                 | lea                 edx, [ecx + 0x13740]
            //   488bc3               | dec                 eax

        $sequence_8 = { ff15???????? ba08000000 488bc8 448d4270 ff15???????? 488bf0 }
            // n = 6, score = 600
            //   ff15????????         |                     
            //   ba08000000           | mov                 edi, dword ptr [esp + 0x30]
            //   488bc8               | dec                 eax
            //   448d4270             | lea                 edx, [0xffff2a22]
            //   ff15????????         |                     
            //   488bf0               | shr                 eax, 3

        $sequence_9 = { 75dd 488d4c2420 ff15???????? 8b542424 418b4750 488d6aff }
            // n = 6, score = 600
            //   75dd                 | sub                 esp, 0x20
            //   488d4c2420           | dec                 eax
            //   ff15????????         |                     
            //   8b542424             | lea                 ebx, [0x1678e]
            //   418b4750             | dec                 eax
            //   488d6aff             | lea                 esi, [0x16787]

    condition:
        7 of them and filesize < 270336
}